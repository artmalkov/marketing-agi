# Competitor Analysis

Cognitive Component для поиска, анализа конкурентов и формирования competitor genotype — таблицы потребностей × конкуренты для сравнения с собственным продуктом.

## Назначение

Компонент даёт инструменты для:

1. **Поиска конкурентов** — определение основного конкурентного окружения (10+ игроков) с базовой информацией: название, сайт, выручка, инвестиции
2. **Глубокого анализа** — детальное изучение выбранных конкурентов, сбор материалов с сайтов и маркетинговых каналов
3. **Competitor genotype** — таблица, сопоставляющая потребности («я хочу…») с конкурентами: 1 = конкурент закрывает потребность, пусто = нет явного упоминания

## Jobs

| Job | Описание | Workflow |
|-----|----------|----------|
| Найти конкурентов | Поиск 10+ конкурентов, сохранение в `competitors/` | `find-competitors-rulebook.md` |
| Глубокий анализ конкурента | Детальный анализ, материалы в папках конкурентов | `deep-analysis-rulebook.md` |
| Собрать генотип конкурентов | Формирование `competitor-genotype.csv` | `competitor-genotype-rulebook.md` |

## Примеры запросов

- *Найти конкурентов:* «найди конкурентов», «competitor research», «find competitors», «кто наши конкуренты»
- *Глубокий анализ:* «глубокий анализ конкурента», «проанализируй конкурента X», «competitor deep dive»
- *Competitor genotype:* «собери генотип конкурентов», «competitor genotype», «таблица потребностей конкурентов»

## Структура вывода

Результаты сохраняются в корне студенческого проекта:

```
student-projects/[student-name]/
  competitors/
    competitors.md           # Сводный список конкурентов
  genotype/
    competitor-genotype.csv  # Потребности × конкуренты
    [competitor-name]/       # Подпапки с материалами по каждому конкуренту
      website.md
      marketing.md
      analysis.md
```

## Зависимости

- **genotype** — для базового списка потребностей и контекста продукта при формировании competitor-genotype
- Web Search, mcp_web_fetch — для поиска и загрузки данных о конкурентах

## Структура компонента

```
knowledge/competitor-analysis/
├── README.md
├── agent.md
├── concepts/concepts/
│   └── competitor-analysis.md
├── data/templates/
│   ├── competitor-genotype-template.csv
│   └── competitors-template.md
└── workflows/
    ├── find-competitors-rulebook.md
    ├── deep-analysis-rulebook.md
    └── competitor-genotype-rulebook.md
```
