## EN

This script creates a complete structure of folders and files specified in project_files.md. 
All files are without content, it is just a skeleton of your future project. 
Now project_files.md contains a complete example containing all possible structure options. You can change the structure to your own. You can use chatjpt to get a textual project hierarchy.
The hierarchy is built with text characters "├── ", "└── ", spaces and tabs, it can contain comments.

### Usage

#### Python installation required

1) Windows powershell
```
winget install Python.Python.3
```
or download the installer from the official Python website.

2) Ubuntu / Debian / Mint
```
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

To simplify on Windows, run create_structure_en.bat it executes create_structure_en.py

1) Windows:
```
python create_structure_ua.py (or py create_structure_ua.py)
```
2) Mac/Linux:
```
python3 create_structure_ua.py
```
Here are all 4 examples of text structures that should work correctly

1)
```
дир-project/
├── .agent/
│   ├── state.md <- Лог знайдених в інтернеті та встановлених 
│   ├── skills_manifest.md
│   └── logs/
│       └── execution.log # файл логування
            інші логи ...
├── docs/
        PROJECT_PLAN.md           <-- Динамічний беклог та статус виконання задач
│       ARCHITECTURE.md
│   └── CONTEXT.md  # Стислий зміст виконаного (для економії контексту)
├── scripts
    ├── setup.sh/setup.ps1 //- файли встановлення
    ├── run.sh/run.ps1
│       test.sh / test.ps1      //- файли тестування
│       validate.sh/validate.ps1
        ...
        (інші скрипти)
├── src/
    tests/
    AGENT_INSTRUCTIONS.md
├── package.json / requirements.txt
└── README.md
├── Скрипти запуску (генеруються агентом в кінці)
```
			
2)
```
app/
    __init__.py
    main.py
    settings.py
    logging.py
adapters/
scanner/
parser/
normalizer/
```
			
3)
```
openwebui-universal-skills-importer/
├── app/
│   ├── __init__.py
│   ├── main.py
│   │
│   ├── core/
│   │   ├── settings.py
│   │   ├── logging.py
│   │
│   ├── adapters/
│   ├── scanner/
│
├── tests/
├── assets/
├── pyproject.toml
├── README.md
└── LICENSE
```
			
4)
```
app/

    core/
        settings.py
        logging.py

    models/
        skill.py
        tool.py

    adapters/
        base.py

        claude/

    normalizer/

    builder/
```
---

## UA

Цей скрипт ствоює повну структуру папок та файлів вказаних в project_files.md. 
Усі файли без вмісту, це лише каркас вашого майбутнього проекту.  
Зараз в project_files.md повний приклад, що містить усі можливі варіанти структури. Ви можете змінювати структуру на вашу власну. Можете використати чатджпт щоб отримати текстову ієрархію проекту.
Ієрархія будується текстовими символами "├── ", "└── ", пробілами та табуляцією, може містити коментарі.


### Використання

#### Необхідно встановлення пайтон

1) Windows powershell
```
winget install Python.Python.3
```
або завантажте інсталятор з офіційного сайту Python.

2) Ubuntu / Debian / Mint
```
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

Для спрощення у Windows запустіть create_structure_ua.bat він виконує create_structure_ua.py

1) Windows: 
```
python create_structure_ua.py (або py create_structure_ua.py)
```
2) Mac/Linux: 
```
python3 create_structure_ua.py
```

Ось всі 4 приклади текстових структур які мають працювати коректно

1)
```
дир-project/
├── .agent/
│   ├── state.md <- Лог знайдених в інтернеті та встановлених 
│   ├── skills_manifest.md
│   └── logs/
│       └── execution.log # файл логування
            інші логи ...
├── docs/
        PROJECT_PLAN.md           <-- Динамічний беклог та статус виконання задач
│       ARCHITECTURE.md
│   └── CONTEXT.md  # Стислий зміст виконаного (для економії контексту)
├── scripts
    ├── setup.sh/setup.ps1 //- файли встановлення
    ├── run.sh/run.ps1
│       test.sh / test.ps1      //- файли тестування
│       validate.sh/validate.ps1
        ...
        (інші скрипти)
├── src/
    tests/
    AGENT_INSTRUCTIONS.md
├── package.json / requirements.txt
└── README.md
├── Скрипти запуску (генеруються агентом в кінці)
```
			
2)
```
app/
    __init__.py
    main.py
    settings.py
    logging.py
adapters/
scanner/
parser/
normalizer/
```
			
3)
```
openwebui-universal-skills-importer/
├── app/
│   ├── __init__.py
│   ├── main.py
│   │
│   ├── core/
│   │   ├── settings.py
│   │   ├── logging.py
│   │
│   ├── adapters/
│   ├── scanner/
│
├── tests/
├── assets/
├── pyproject.toml
├── README.md
└── LICENSE
```
			
4)
```
app/

    core/
        settings.py
        logging.py

    models/
        skill.py
        tool.py

    adapters/
        base.py

        claude/

    normalizer/

    builder/
```
