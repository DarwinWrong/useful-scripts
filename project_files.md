дир-project/
├── .agent/
│   ├── state.md <- Лог знайдених в інтернеті та встановлених 
│   ├── skills_manifest.md
│   └── logs/
│       └── execution.log # файл логування
			інші логи ...
├── docs/
    	PROJECT_PLAN.md           <-- Динамічний беклог та статус виконання задач
│   	ARCHITECTURE.md
│   └── CONTEXT.md	# Стислий зміст виконаного (для економії контексту)
├── scripts
    ├── setup.sh/setup.ps1 //- файли встановлення
    ├── run.sh/run.ps1
│   	test.sh / test.ps1		//- файли тестування
│   	validate.sh/validate.ps1
		...
		(інші скрипти)
├── src/
    tests/
	AGENT_INSTRUCTIONS.md
├── package.json / requirements.txt
└── README.md
├── Скрипти запуску (генеруються агентом в кінці)