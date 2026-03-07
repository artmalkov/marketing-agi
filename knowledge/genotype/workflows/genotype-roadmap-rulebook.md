# Genotype Roadmap Rulebook

## Document Metadata

- **Version:** 1.0.0
- **Creation Date:** 2026-03-05
- **Purpose:** Define rules for creating and updating a product roadmap based on genotype needs and release plans

---

## Purpose

This rulebook defines the process for creating or updating a **genotype roadmap** — a CSV table that maps each client need (from genotype) to planned releases, with an assessment of how well each feature is implemented at each fidelity level (Hero, Good-Enough, Quick-and-Dirty, Placeholder, or Zero).

The roadmap is built from:
- **Input:** Text description of plans, project commands, release schedule — when the release is, what it's called, and what features/functions are planned
- **Source of needs:** Needs list from the student project's genotype (call-database.md or genotype table)
- **Output:** A CSV file in the student project's genotype folder, following the genotype-roadmap-template.csv structure

---

## Related Concepts

- **Genotype Fidelity Taxonomy** (`knowledge/genotype/concepts/taxonomies/genotype-fidelity-taxonomy.md`) — defines fidelity levels H, G, Q, P, Z for feature implementation
- **Genotype Needs Taxonomy** (`knowledge/genotype/concepts/taxonomies/genotype-needs-taxonomy.md`) — defines need intensity levels T, M, D, N, U
- **Product Genotype** (`knowledge/genotype/concepts/concepts/product-genotype.md`) — demand vector (needs) vs supply vector (solutions)
- **Genotype Template** (`knowledge/genotype/data/templates/genotype-template.csv`) — template for genotype table with needs and client mapping; described in another rulebook
- **Genotype Roadmap Template** (`knowledge/genotype/data/templates/genotype-roadmap-template.csv`) — template for creating the roadmap file

---

## Step 1. Определение студенческого проекта (критично)

**Очень важно не ошибиться с выбором проекта.** Изменение чужого проекта может серьёзно навредить другому студенту.

### Способы определения целевого проекта

Используй **все доступные сигналы** и действуй по приоритету:

1. **Явно указанный путь или источник данных**
   - Пользователь указал путь к файлу: `student-projects/[student-name]/...` → проект определён
   - Пользователь сослался на файл (например, call-database.md, genotype roadmap) → путь к файлу однозначно определяет проект

2. **Открытый в IDE файл**
   - Если в редакторе открыт файл из `student-projects/[student-name]/...`, считаем этот проект целевым
   - Проверь путь открытого файла перед началом работы

3. **Контекст запроса**
   - Пользователь упомянул имя студента или проекта
   - Пользователь работал с данным проектом в предыдущих сообщениях

### Защита от ошибки

**Обязательные проверки перед любыми изменениями:**

- [ ] **Подтверждение:** Если проект не очевиден из одного источника — явно спроси пользователя: «Работаем с проектом `[student-name]`?»
- [ ] **Единственность:** Убедись, что определён ровно один проект. Если возможны два — не действуй, запроси уточнение.
- [ ] **Проверка пути:** Все пути к файлам должны начинаться с `student-projects/[student-name]/`. Никогда не пиши в `student-projects/` без имени студента.
- [ ] **Читай перед записью:** Перед изменением файла проверь, что он принадлежит выбранному проекту.

**Структура студенческих проектов:**
```
student-projects/
  [student-name]/           ← имя папки = идентификатор проекта
    genotype/
      call-database.md      ← источник потребностей (Needs)
      genotype-roadmap.csv  ← целевой файл roadmap (создавать, если отсутствует)
    customer-calls/
    employees/
```

---

## Step 2. Источники входных данных

### 2.1. Описание релизов (обязательно)

Определи, откуда берутся описания релизов:

- **Текстовое описание:** Пользователь указал или вставил описание планов, roadmap, release schedule
- **Команды проекта:** Пользователь указал команды или документы с планами разработки
- **Файлы:** Пользователь сослался на файл(ы) с описанием релизов

**Для каждого релиза необходимо извлечь:**
- **Дата релиза** (release date)
- **Название релиза** (release name)
- **Список фич и функций** (features/functions), planned for this release

### 2.2. Список потребностей (Needs)

**Источник:** `student-projects/[student-name]/genotype/genotype.md`
- если файл `student-projects/[student-name]/genotype/genotype.md` отсутствует, то использовать как источник `student-projects/[student-name]/genotype/call-database.md`

Если в проекте есть genotype table (CSV, заполненный по genotype-template.csv) — используй его, если он содержит более полные данные (budget, need level). Иначе используй call-database.md.

**Из call-database.md извлеки для каждой потребности:**
- **Section** — Need Category (из поля Need Category) или группировка по смыслу
- **Need** — формулировка «I want [need]» (из заголовка NEED-XXX)
- **Number** — количество клиентов, заинтересованных в этой потребности (Frequency)
- **Budget** — суммарный бюджет клиентов, заявленный ими (если есть в данных; иначе — оставить пустым или оценить)
- **Need Level** — уровень потребности по genotype-needs-taxonomy: T, M, D, N, U

---

## Step 3. Генерация roadmap CSV

### 3.1. Создание файла roadmap

**Целевой файл:** `student-projects/[student-name]/genotype/genotype-roadmap.csv`

1. **Проверь наличие** `genotype/genotype-roadmap.csv` в проекте.
2. **Если файл отсутствует** → **создай** его на основе `knowledge/genotype/data/templates/genotype-roadmap-template.csv`.
3. **Если файл существует** → обновляй его, сохраняя структуру и добавляя новые релизы или потребности при необходимости.

### 3.2. Структура CSV (по шаблону)

- **Строки 1–4:** Заголовки
  - Строка 1: даты релизов
  - Строка 2: названия релизов


- **Строки 5+:** Потребности
  - Каждая строка — одна потребность (need)
  - Секции потребностей группируются по [NEEDS SECTION NAME 1], [NEEDS SECTION NAME 2], …

### 3.3. Заполнение строк потребностей

**Колонки, копируемые из genotype (call-database.md или genotype table):**

| Колонка | Источник | Описание |
|---------|----------|----------|
| Section | Need Category | Имя секции/группы потребностей |
| Need | NEED-XXX: I want [need] | Формулировка потребности |
| Number | Frequency | Количество клиентов |
| Budget | Агрегированный бюджет | Суммарный бюджет |
| Need Level | genotype-needs-taxonomy | T, M, D, N, U |

**Колонки релизов:**

Для каждой колонки релиза (release1, release2, …) заполни ячейку по следующему правилу.

---

## Step 4. Оценка фич по Genotype Fidelity Taxonomy

### 4.1. Уровни fidelity (от низшего к высшему)

| Буква | Уровень | Описание |
|-------|---------|----------|
| **Z** | Zero | Не реализовано; сознательно не делаем |
| **P** | Placeholder | Заглушка, демо; видимость без реальной функции |
| **Q** | Quick-and-Dirty | Работает «как-то», хрупко, быстро сделано |
| **G** | Good-Enough | Нормально, как у конкурентов, ~1–3 недели |
| **H** | Hero | Уникально, отлично, месяцы работы |

### 4.2. Формат ячейки в колонке релиза

**Формат:** `[H|G|Q|P|Z] - [краткое описание фичи]`

**Примеры:**
- `G - Базовая поддержка нескольких языков`
- `Q - Простой экспорт в CSV`
- `H - Уникальный AI-ассистент по контексту проекта`
- `P - Кнопка «Мультиязычность» в демо (не реализована)`
- `Z` — если в этом релизе не планируется ничего по данной потребности

### 4.3. Критическое правило: монотонность fidelity

**Строка (потребность) может только улучшаться от релиза к релизу.**

- Для каждой потребности (строки) отслеживай **максимальный достигнутый уровень** fidelity.
- Порядок уровней: **Z < P < Q < G < H**.
- Если в релизе N реализация фичи слабее, чем в релизе N−1 — **всё равно пиши максимальный уровень**, достигнутый к этому моменту (включая релизы 1…N).

**Примеры:**

- Релиз 1: `G - Базовая мультиязычность` → уровень G достигнут.
- Релиз 2: сделано небольшое улучшение, но оно не тянет на G — пишем `G` (или выше, если улучшение реально выше).
- Релиз 3: по этой потребности ничего не делаем — пишем `G` (максимум, достигнутый ранее).
- Релиз 4: сделали Hero-реализацию — пишем `H - ...`.

**Итог:** Каждая строка (need) никогда не «откатывается» вниз по fidelity; уровень всегда либо сохраняется, либо растёт.

---

## Step 5. Сопоставление фич релизов с потребностями

### 5.1. Алгоритм сопоставления

1. Для каждой потребности (строки) из genotype определи, **какие фичи релиза** её закрывают.
2. Для каждой фичи релиза определи, **какую потребность** она удовлетворяет.
3. Сопоставление может быть «один-к-одному» или «многие-к-одному» (несколько фич в одном релизе могут относиться к одной потребности — выбирай лучшую реализацию).

### 5.2. Заполнение ячеек

- Если фича **реализует** потребность: оцени fidelity по taxonomy и запиши в формате `[H|G|Q|P|Z] - [краткое описание]`.
- Если **ни одна фича** релиза не закрывает потребность: запиши `Z` (или максимальный уровень, достигнутый в предыдущих релизах, если он уже выше Z).
- Если потребность **частично** закрыта: выбери уровень, соответствующий степени реализации (Q, P и т.д.).

---

## Step 6. Обновление roadmap при новой информации

### 6.1. Когда обновлять

- Появились новые данные из интервью/звонков → **сначала обнови genotype** (call-database.md и/или genotype table по соответствующему rulebook).
- Изменились планы релизов → обнови roadmap.
- Добавились новые потребности → добавь строки в roadmap.
- Добавились новые релизы → добавь колонки в roadmap.

### 6.2. Порядок обновления

1. **Сначала** — обновление genotype (call-database, genotype table). Genotype template и процесс заполнения описаны в отдельном rulebook.
2. **Затем** — обновление genotype-roadmap.csv на основе актуального списка потребностей и планов релизов.

---

## Step 7. Проверка перед сохранением

Перед записью файла убедись:

- [ ] **Целевой файл:** Записываешь в `genotype/genotype-roadmap.csv`
- [ ] Путь к файлу содержит правильный `[student-name]`
- [ ] Все потребности из genotype (call-database.md) перенесены в строки
- [ ] Для каждой колонки релиза: fidelity-уровни H, G, Q, P, Z используются корректно
- [ ] Для каждой строки потребности: уровень fidelity не убывает слева направо (монотонность)
- [ ] Формат ячеек: `[H|G|Q|P|Z] - [краткое описание]` (или `Z` без описания, если не реализовано)

---

## Output

- **Созданный или обновлённый файл:** `student-projects/[student-name]/genotype/genotype-roadmap.csv`
- **Сообщение пользователю:** Кратко опиши, что сделано: какие релизы добавлены, сколько потребностей отображено, на основе каких источников (описание планов, call-database).

---

## Quality Criteria

**Полнота:**
- Все потребности из genotype отражены в roadmap
- Все фичи релизов сопоставлены с потребностями, где это уместно

**Корректность:**
- Fidelity-уровни соответствуют genotype-fidelity-taxonomy
- Need levels соответствуют genotype-needs-taxonomy
- Монотонность fidelity не нарушена

**Согласованность:**
- Описание фич в ячейках совпадает с планами релизов
- Структура CSV соответствует genotype-roadmap-template.csv
