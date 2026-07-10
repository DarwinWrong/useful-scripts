#!/usr/bin/env python3
"""
Генератор структур, який підтримує:
- звичайні відступи (пробіли/табуляція)
- псевдографіку (малювання блоків)
- коментарі (#, <-, //)
- елементи на кореневому рівні (глибина 0) після кореня
"""

import os
import re
import sys

# Дозволені псевдографічні символи (малювання блоків Unicode)
def is_tree_char(ch: str) -> bool:
    return 0x2500 <= ord(ch) <= 0x257F

def is_whitespace_or_tree(ch: str) -> bool:
    return ch in (' ', '\t') or is_tree_char(ch)

def remove_comments(line: str) -> str:
    """Remove everything after #, <--, <-, // (але тримайся шляху)."""
    m = re.search(r'(#|<--|<-|//)', line)
    if m:
        return line[:m.start()].rstrip()
    return line

def is_ignored_name(name: str) -> bool:
    """Пропускати рядки, які не є фактичними файлами/папками."""
    name = name.strip()
    if not name:
        return True
    if all(ch == '.' for ch in name):
        return True
    if '(' in name or ')' in name:   # e.g. "(інші скрипти)"
        return True
    if name.endswith('...'):
        return True
    return False

def is_hidden_dir(name: str) -> bool:
    return name.startswith('.') and '.' not in name[1:]

def split_names(raw_name: str):
    """Handle names with ' / ' or '/' (e.g., setup.sh/setup.ps1)."""
    if ' / ' in raw_name:
        parts = raw_name.split(' / ')
        return [p.strip() for p in parts if p.strip()]
    elif '/' in raw_name:
        parts = raw_name.split('/')
        return [p.strip() for p in parts if p.strip()]
    else:
        return [raw_name.strip()]

def parse_tree(file_path: str, tab_size: int = 4):
    if not os.path.isfile(file_path):
        raise FileNotFoundError(f"Файл {file_path} не знайдено.")

    with open(file_path, 'r', encoding='utf-8') as f:
        raw_lines = f.readlines()

    root_name = None
    actions = []          # (parent, is_dir, names_list)
    folder_stack = []     # [(depth, full_path)]

    for raw_line in raw_lines:
        line = raw_line.rstrip('\n\r')
        line = line.expandtabs(tab_size)      # tabs → spaces
        line = remove_comments(line)          # remove comments
        if not line.strip():
            continue

        # Префікс = усі початкові символи, які є пробілами, табуляцією або деревоподібною структурою
        prefix_end = 0
        while prefix_end < len(line) and is_whitespace_or_tree(line[prefix_end]):
            prefix_end += 1
        prefix = line[:prefix_end]
        name = line[prefix_end:].strip()

        if is_ignored_name(name):
            continue

        depth = len(prefix)   # глибина = довжина префікса

        # Корінь – перший рядок глибиною 0
        if root_name is None:
            if depth == 0:
                root_name = name.rstrip('/')
                folder_stack.append((0, root_name))
                continue
            else:
                raise ValueError("Кореневий елемент не знайдено (спочатку очікувалася глибина 0).")

        # Визначте, чи це папка, чи файл
        if name.endswith('/'):
            is_dir = True
            clean_name = name.rstrip('/')
            names = [clean_name]
        else:
            names = split_names(name)
            first_name = names[0]
            is_dir = is_hidden_dir(first_name) or ('.' not in first_name)

        # Знайти батьківську папку
        if depth == 0:
            # Елементи глибини 0 (без відступу) належать батьківському елементу кореневого елемента
            # Видалити всі попередні елементи глибини 0, крім самого кореневого елемента
            while len(folder_stack) > 1 and folder_stack[-1][0] == 0:
                folder_stack.pop()
            parent = ""   # порожній рядок означає «той самий рівень, що й корінь»"
        else:
            # Normal indentation: find the closest folder with depth < current
            while len(folder_stack) > 1 and folder_stack[-1][0] >= depth:
                folder_stack.pop()
            if not folder_stack:
                raise ValueError(f"Недійсний відступ у рядку: {raw_line.strip()}")
            parent = folder_stack[-1][1]

        actions.append((parent, is_dir, names))

        # Якщо це папка, помістіть її в стек для майбутнього вкладення
        if is_dir:
            full_path = os.path.join(parent, names[0]) if parent else names[0]
            folder_stack.append((depth, full_path))

    if root_name is None:
        raise ValueError("Кореневу папку не знайдено.")
    return root_name, actions


def create_structure(root_dir: str, actions: list, base_path: str = '.'):
    root_path = os.path.join(base_path, root_dir)
    os.makedirs(root_path, exist_ok=True)
    print(f"Корінь: {root_path}")

    for parent, is_dir, names in actions:
        for name in names:
            if parent:
                full_path = os.path.join(base_path, parent, name)
            else:
                full_path = os.path.join(base_path, name)

            if is_dir:
                os.makedirs(full_path, exist_ok=True)
                print(f"[КАТАЛОГ] {full_path}")
            else:
                if not os.path.exists(full_path):
                    open(full_path, 'a').close()
                    print(f"[ФАЙЛ] {full_path}")
                else:
                    print(f"[ПРОПУСТИТИ] {full_path} (існує)")


if __name__ == '__main__':
    args = sys.argv[1:]
    md_file = 'project_files.md'
    out_dir = '.'
    tab_size = 4

    i = 0
    while i < len(args):
        if args[i] == '--tab-size' and i+1 < len(args):
            tab_size = int(args[i+1])
            i += 2
        elif md_file == 'project_files.md' and not args[i].startswith('--'):
            md_file = args[i]
            i += 1
        elif out_dir == '.' and not args[i].startswith('--'):
            out_dir = args[i]
            i += 1
        else:
            i += 1

    try:
        root, actions = parse_tree(md_file, tab_size)
        create_structure(root, actions, out_dir)
        print("\n✅ Структура успішно створена.")
    except Exception as e:
        print(f"❌ Помилка: {e}", file=sys.stderr)
        sys.exit(1)
