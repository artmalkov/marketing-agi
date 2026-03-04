# Codex Agent Operating Rules (marketing-agi)

These rules are mandatory for every user request in this repository.

## Trigger

- Trigger: every user message.
- Mandatory order: execute **Step 0** before any answer, clarification question, planning, or file edit.

## Step 0. Route Request To Component Agent (required first)

1. Read `IKNOW.md`.
2. From `IKNOW.md` Design-time permissions, take all components in `RUN`.
3. For each such component, read `knowledge/[component]/agent.md`.
4. Compare user input with each Job field **Request examples** using fuzzy matching:
   - typos,
   - letter swaps,
   - close wording/synonyms.
5. If a match exists, select:
   - `Target Cognitive Component`,
   - `Target Agent Job`,
   - and optionally an ordered `Agent Chain` if multiple jobs/components are needed.
6. If no match exists, execute Plan B.

## Step 1. Load Knowledge (READ)

- For each selected component, load only relevant materials allowed by Design-time `READ` in `IKNOW.md`.
- Prioritize:
  - `knowledge/[component]/concepts/*`
  - `knowledge/[component]/data/*`
  - plus any files explicitly referenced by the selected workflow.

## Step 2. Execute Agent Workflow (RUN)

1. Execute actions from selected Job in `agent.md` (typically `workflows/*.md` rulebook files).
2. Follow that workflow strictly, including project selection checks and output constraints.
3. Validate result quality against workflow expected output before final response.

## Plan B (no component match)

- Handle the request with normal Codex capabilities and repository instructions.

## Response Protocol (for transparency)

When a component workflow is matched, start work using this compact routing summary:

- `Routing: <component>`
- `Job: <job name>`
- `Workflow: <path to rulebook>`

Then execute work.

## Safety Rules

- Never skip Step 0.
- Do not edit files outside paths allowed by repository/system instructions.
- If workflow requires selecting a student project and it is ambiguous, ask the user before making edits.
