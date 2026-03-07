# Deep Analysis Rulebook

## Document Metadata

- **Version:** 1.0.0
- **Purpose:** Define rules for conducting deep analysis of one or more competitors

---

## Purpose

This rulebook defines the process for conducting a detailed analysis of selected competitors. Results are stored in each competitor's subfolder within `competitors/`.

---

## Related Concepts

- **Competitor Analysis** (`knowledge/competitor-analysis/concepts/concepts/competitor-analysis.md`)

---

## Step 1. Определение студенческого проекта (критично)

- Путь: `student-projects/[student-name]/competitors/`
- Если проект не очевиден — спроси пользователя

---

## Step 2. Выбор конкурентов для анализа

### 2.1. Источник списка

- Файл `competitors/competitors.md` — список уже найденных конкурентов
- Пользователь может явно указать одного или нескольких конкурентов

### 2.2. Определение целевых конкурентов

- Если пользователь указал имена — анализируй только их
- Если не указал — уточни или выбери 1–3 наиболее релевантных (по размеру, схожести продукта, доступности информации)

---

## Step 3. Сбор материалов по конкуренту

Для каждого выбранного конкурента:

### 3.1. Папка конкурента

`competitors/[competitor-name]/`

### 3.2. Материалы для сбора

- **website.md** — ключевые выдержки с сайта: описание продукта, фичи, ценностное предложение, тарифы
- **marketing.md** — рекламные материалы, скриншоты/тексты с лендингов, рекламные сообщения (если доступны)
- **analysis.md** — результаты глубокого анализа (структура уточняется по мере развития компонента)

### 3.3. Инструменты

- **mcp_web_fetch** — загрузка главной страницы, страниц продукта, pricing
- **Web Search** — поиск отзывов, обзоров, новостей о конкуренте

---

## Step 4. Глубокий анализ (содержание)

На данном этапе фокус — на сборе материалов. Детальное содержание `analysis.md` будет уточняться позже. Минимум:

- Краткое резюме: кто конкурент, что предлагает, ключевые фичи
- Выявленные selling points и сообщения (для последующего маппинга на потребности в competitor-genotype)

---

## Step 5. Сохранение

- Все файлы — в `competitors/[competitor-name]/`
- Формат — Markdown, UTF-8

---

## Output

- Обновлённые/созданные файлы в папках конкурентов
- Сообщение пользователю: какие конкуренты проанализированы, что собрано
