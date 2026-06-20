@echo off
pushd "%~dp0"
call venv\Scripts\activate.bat
pip install -r requirements.txt
python deepseek_tokenizer.py
deactivate
popd