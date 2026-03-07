# Genotype Processing Agent

## Когда применять агента

Применять когда пользователю нужно создать или обновить genotype-таблицу или roadmap на основе потребностей клиентов из call-database.

## Agent Jobs

### Обновить genotype-таблицу

**Описание**: Создаёт или обновляет CSV-таблицу genotype, сопоставляющую потребности клиентов с интервью и опросами, с подсчётом голосов по источникам.

**Ситуация**: Есть call-database.md в папке genotype студенческого проекта. Нужно сформировать или обновить genotype.csv — таблицу потребностей с привязкой к звонкам/интервью.

**Примеры запроса**: обнови genotype, создай genotype, сформируй genotype из call-database, обнови таблицу потребностей, genotype update, build genotype from calls

**Действия**: выполнить `workflows/genotype-update-rulebook.md`

**Ожидаемый результат**: файл `genotype.csv` в папке genotype студенческого проекта (или обновление существующего).

---

### Создать или обновить genotype roadmap

**Описание**: Создаёт или обновляет roadmap — CSV-таблицу, сопоставляющую потребности клиентов с запланированными релизами и оценкой реализации по уровням fidelity (Hero, Good-Enough, Quick-and-Dirty, Placeholder, Zero).

**Ситуация**: Есть genotype или call-database с потребностями и описание планов/релизов. Нужно сформировать genotype-roadmap.csv.

**Примеры запроса**: создай roadmap, обнови roadmap, genotype roadmap, roadmap по потребностям, план релизов по genotype, product roadmap

**Действия**: выполнить `workflows/genotype-roadmap-rulebook.md`

**Ожидаемый результат**: файл `genotype-roadmap.csv` в папке genotype студенческого проекта.

---
