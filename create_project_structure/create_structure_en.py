#!/usr/bin/env python3
"""
Structure generator that supports:
- plain indentation (spaces/tabs)
- pseudo-graphics (box-drawing)
- comments (#, <-, //)
- items at root level (depth 0) after the root
"""

import os
import re
import sys

# Allowed pseudo-graphics characters (Unicode box-drawing)
def is_tree_char(ch: str) -> bool:
    return 0x2500 <= ord(ch) <= 0x257F

def is_whitespace_or_tree(ch: str) -> bool:
    return ch in (' ', '\t') or is_tree_char(ch)

def remove_comments(line: str) -> str:
    """Remove everything after #, <--, <-, // (but keep the path)."""
    m = re.search(r'(#|<--|<-|//)', line)
    if m:
        return line[:m.start()].rstrip()
    return line

def is_ignored_name(name: str) -> bool:
    """Skip lines that are not actual files/folders."""
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
        raise FileNotFoundError(f"File {file_path} not found.")

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

        # Prefix = all leading chars that are spaces, tabs, or tree-drawing
        prefix_end = 0
        while prefix_end < len(line) and is_whitespace_or_tree(line[prefix_end]):
            prefix_end += 1
        prefix = line[:prefix_end]
        name = line[prefix_end:].strip()

        if is_ignored_name(name):
            continue

        depth = len(prefix)   # depth = length of prefix

        # Root – first line with depth 0
        if root_name is None:
            if depth == 0:
                root_name = name.rstrip('/')
                folder_stack.append((0, root_name))
                continue
            else:
                raise ValueError("Root element not found (expected depth 0 first).")

        # Determine if it's a folder or file
        if name.endswith('/'):
            is_dir = True
            clean_name = name.rstrip('/')
            names = [clean_name]
        else:
            names = split_names(name)
            first_name = names[0]
            is_dir = is_hidden_dir(first_name) or ('.' not in first_name)

        # Find the parent folder
        if depth == 0:
            # Items at depth 0 (no indent) belong to the parent of the root
            # Remove all previous depth-0 items except the root itself
            while len(folder_stack) > 1 and folder_stack[-1][0] == 0:
                folder_stack.pop()
            parent = ""   # empty string means "same level as root"
        else:
            # Normal indentation: find the closest folder with depth < current
            while len(folder_stack) > 1 and folder_stack[-1][0] >= depth:
                folder_stack.pop()
            if not folder_stack:
                raise ValueError(f"Invalid indentation at line: {raw_line.strip()}")
            parent = folder_stack[-1][1]

        actions.append((parent, is_dir, names))

        # If it's a folder, push it onto the stack for future nesting
        if is_dir:
            full_path = os.path.join(parent, names[0]) if parent else names[0]
            folder_stack.append((depth, full_path))

    if root_name is None:
        raise ValueError("Root folder not found.")
    return root_name, actions


def create_structure(root_dir: str, actions: list, base_path: str = '.'):
    root_path = os.path.join(base_path, root_dir)
    os.makedirs(root_path, exist_ok=True)
    print(f"Root: {root_path}")

    for parent, is_dir, names in actions:
        for name in names:
            if parent:
                full_path = os.path.join(base_path, parent, name)
            else:
                full_path = os.path.join(base_path, name)

            if is_dir:
                os.makedirs(full_path, exist_ok=True)
                print(f"[DIR]  {full_path}")
            else:
                if not os.path.exists(full_path):
                    open(full_path, 'a').close()
                    print(f"[FILE] {full_path}")
                else:
                    print(f"[SKIP] {full_path} (exists)")


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
        print("\n✅ Structure created successfully.")
    except Exception as e:
        print(f"❌ Error: {e}", file=sys.stderr)
        sys.exit(1)
