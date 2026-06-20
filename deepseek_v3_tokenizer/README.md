# DeepSeek Tokenizer

## Note (UA)

Цей каталог містить **скрипт токенізатора** для моделі DeepSeek.

## Що робить `deepseek_tokenizer.py`

- Завантажує токенізатор із поточної теки (`./`) за допомогою `transformers.AutoTokenizer`.
- Підтримує два режими через CLI:
  - `--text "<рядок>"` – токенізує довільний рядок.
  - `--file <шлях>` – читає UTF‑8 файл і токенізує його вміст.
- Повертає:
  - **Token IDs** – список ідентифікаторів токенів;
  - **Tokens** – фактичні токени;
  - **Total tokens** – кількість токенів;
  - **Word count** – кількість слів у вхідному тексті;
  - **Tokens per 1, 100, 1000 words** – співвідношення токенів до 1, 100 і 1000 слів (округлене до 2‑х знаків).
- Після виводу результату скрипт чекає натискання **Enter**, щоб консольне вікно не закривалося автоматично.

Цей скрипт використовується для швидкої перевірки токенізації та оцінки токен‑бюджету під час розробки.


## Як запустити

1. **Створіть віртуальне оточення** (виконується автоматично при першому запуску `run_tokenizer.bat`):
   ```bat
   python -m venv venv
   ```
2. **Встановіть залежності** (transformers і torch) через `requirements.txt`:
   ```bat
   call venv\Scripts\activate.bat
   pip install -r requirements.txt
   ```
3. **Запуск через меню** – двічі клацніть `menu_tokenizer.bat`. У меню можна:
   - ввести довільний рядок (опція 1) і отримати токени, кількість слів і співвідношення;
   - вказати шлях до текстового файлу (опція 2) і отримати ті ж дані;
   - або вийти (опція 3).
   Після виконання скрипту вивід залишається на екрані, і ви можете повернутися до меню для наступного підрахунку.
4. **Прямий запуск** (за потреби):
   ```bat
   python deepseek_tokenizer.py --text "Your text"
   python deepseek_tokenizer.py --file "path\to\file.txt"
   ```
   або просто двічі клацніть `run_tokenizer.bat` – бат‑файл активує `venv`, встановить залежності (при першому запуску) і виконає скрипт з демо‑рядком.

## Файли у теці

- `deepseek_tokenizer.py` – сам скрипт.
- `tokenizer_config.json`, `tokenizer.json` – конфігурація та vocab токенізатора.
- `requirements.txt` – перелік Python‑залежностей (`transformers>=4.0.0` та `torch`).
- `run_tokenizer.bat` – бат‑файл для швидкого запуску віртуального оточення.

## Примітка

Після успішного запуску ви побачите список токен‑ідентифікаторів. Якщо потрібен список саме токенів, замініть останній рядок у `deepseek_tokenizer.py` на
```python
print(tokenizer.convert_ids_to_tokens(result))
```

---

## Note (EN)

**DeepSeek Tokenizer**

This directory contains a **tokenizer script** for the DeepSeek model.

### What `deepseek_tokenizer.py` does

- Loads the tokenizer from the current directory (`./`) using `transformers.AutoTokenizer`.
- Supports two CLI modes:
  - `--text "<string>"` – tokenizes an arbitrary string.
  - `--file <path>` – reads a UTF‑8 file and tokenizes its contents.
- Returns:
  - **Token IDs** – list of token identifiers;
  - **Tokens** – the actual token strings;
  - **Total tokens** – number of tokens;
  - **Word count** – number of whitespace‑separated words in the input text;
  - **Tokens per 1, 100, 1000 words** – token‑to‑word ratios (rounded to two decimal places).
- After printing the results, the script waits for **Enter** so the console window does not close automatically.

This script is intended for quick verification of tokenization and for estimating token budget during development.

### How to run

1. **Create a virtual environment** (automatically done on the first run of `run_tokenizer.bat`):
   ```bat
   python -m venv venv
   ```
2. **Install dependencies** (`transformers` and `torch`) via `requirements.txt`:
   ```bat
   call venv\Scripts\activate.bat
   pip install -r requirements.txt
   ```
3. **Run via the menu** – double‑click `menu_tokenizer.bat`. In the menu you can:
   - Enter an arbitrary text (option 1) to get tokens, word count and ratios.
   - Provide a path to a text file (option 2) to get the same data.
   - Exit (option 3).
   After each run the output remains on screen and you can return to the menu for another calculation.
4. **Direct launch** (if needed):
   ```bat
   python deepseek_tokenizer.py --text "Your text"
   python deepseek_tokenizer.py --file "path\to\file.txt"
   ```
   or simply double‑click `run_tokenizer.bat` – the batch file activates the `venv`, installs dependencies (on first run) and runs the script with the demo string.

### Files in this directory

- `deepseek_tokenizer.py` – the script.
- `tokenizer_config.json`, `tokenizer.json` – tokenizer configuration and vocab files.
- `requirements.txt` – list of Python dependencies (`transformers>=4.0.0` and `torch`).
- `run_tokenizer.bat` – batch file for quick virtual‑environment launch.
- `menu_tokenizer.bat` – interactive menu batch file.

### Note

After a successful run you will see a list of token IDs. If you need the actual token strings, replace the last line in `deepseek_tokenizer.py` with:
```python
print(tokenizer.convert_ids_to_tokens(result))
```
---