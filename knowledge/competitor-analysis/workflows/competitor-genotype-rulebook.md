# Competitor Genotype Rulebook

## Document Metadata

- **Version:** 1.0.0
- **Purpose:** Define rules for creating competitor-genotype.csv — mapping needs to competitors

---

## Purpose

This rulebook defines the process for creating **competitor-genotype.csv** — a table where:
- **Rows** — needs (in format «я хочу…»), grouped by sections, as in genotype
- **Columns** — competitor names (instead of interviews)
- **Cells** — 1 if the competitor explicitly addresses this need in their materials; empty otherwise

---

## Related Concepts

- **Product Genotype** (`knowledge/genotype/concepts/concepts/product-genotype.md`)
- **Genotype Needs Taxonomy** (`knowledge/genotype/concepts/taxonomies/genotype-needs-taxonomy.md`)
- **Competitor Analysis** (`knowledge/competitor-analysis/concepts/concepts/competitor-analysis.md`)
- **Genotype Template** (`knowledge/genotype/data/templates/genotype-template.csv`)
- **Competitor Genotype Template** (`knowledge/competitor-analysis/data/templates/competitor-genotype-template.csv`)

---

## Step 1. Определение студенческого проекта (критично)

- Путь: `student-projects/[student-name]/`
- Целевой файл: `genotype/competitor-genotype.csv`
- Если проект не очевиден — спроси пользователя

---

## Step 2. Источники данных

### 2.1. Базовый список потребностей

**Источник:** `student-projects/[student-name]/genotype/genotype.csv`

Извлеки все потребности (строки вида «я хочу …») и их секции. Это — начальный набор строк для competitor-genotype.

### 2.2. Материалы конкурентов

**Источники:**
- `competitors/competitors.md` — список конкурентов
- `competitors/[competitor-name]/website.md` — выдержки с сайта
- `competitors/[competitor-name]/marketing.md` — рекламные материалы
- `competitors/[competitor-name]/analysis.md` — если есть

Если материалов нет — используй **mcp_web_fetch** или **Web Search** для загрузки сайтов конкурентов и извлечения selling points.

---

## Step 3. Извлечение supply vector конкурентов

Для каждого конкурента:

1. Проанализируй сайт и маркетинговые материалы
2. Выдели **продукты и ключевые фичи**, которые они продвигают
3. Сформулируй их как selling points (что обещают клиенту)

---

## Step 4. Маппинг на потребности

### 4.1. Совпадение с нашим генотипом

Если selling point конкурента **явно соответствует** потребности из нашего genotype:
- Ставь **1** в ячейке (потребность × конкурент)
- Если соответствие неочевидное — оставь пусто

### 4.2. Новые потребности (дообогащение)

Если несколько конкурентов продвигают **одну и ту же фичу/сообщение**, которой нет в нашем генотипе:
- Сформулируй **корневую потребность** в формате «я хочу …» (потребность, а не фича)
- Добавь новую строку в соответствующую секцию (или создай секцию)
- Поставь 1 у тех конкурентов, кто эту потребность адресует

**Правило:** добавляй потребности, а не фичи. Несколько конкурентов с одной фичей → одна потребность «я хочу …».

---

## Step 5. Структура competitor-genotype.csv

### 5.1. Формат (как genotype-template)

- **Разделитель:** `;` (точка с запятой)
- **Кодировка:** UTF-8 с BOM

### 5.2. Заголовки (строки 1–4)

| Строка | Содержимое |
|--------|------------|
| 1 | ;;;;[Competitor1];[Competitor2];… |
| 2 | ;;;;[Competitor1];[Competitor2];… (дублирование или пусто) |
| 3 | ;;Competition;;[comp1];[comp2];… |
| 4 | (при необходимости) |

Колонки 1–4: Section, Need, Competition, пусто.  
Колонки 7+: имена конкурентов.

### 5.3. Строки потребностей

| Кол 1 | Кол 2 | Кол 3 | Кол 4 | Кол 5+ |
|-------|-------|-------|-------|--------|
| Section или пусто | я хочу … | Competition | пусто | 1 или пусто |

Competition (число) = «сколько конкурентов закрывают или заявляют эту потребность».

### 5.4. Ячейки конкурентов

- **1** — конкурент явно продвигает решение данной потребности на сайте или в материалах
- **Пусто** — явного упоминания нет

---

## Step 6. Проверка перед сохранением

- [ ] Все потребности из genotype.csv учтены (или обоснованно пропущены)
- [ ] Новые потребности сформулированы как «я хочу …», не как фичи
- [ ] Все конкуренты из competitors.md представлены колонками
- [ ] 1 только там, где есть явное соответствие в материалах
- [ ] Формат CSV: `;` разделитель, UTF-8

---

## Output

- **competitor-genotype.csv** в `student-projects/[student-name]/genotype/`
- Сообщение пользователю: сколько потребностей, сколько конкурентов, какие новые потребности добавлены
