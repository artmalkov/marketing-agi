# Genotype Fidelity Taxonomy

## Introduction

This taxonomy defines **fidelity levels** for implementing product functions. When we build a product, we can implement different features and modules at different fidelity levels — from outstanding to non-existent. Each level implies different effort, cost, robustness, and market positioning.

The taxonomy helps teams make conscious decisions about where to invest deeply and where to ship quickly, aligning implementation fidelity with strategy and resources.

---

## Taxonomy Tree

```
Feature Fidelity Level
│
├── HERO (Holistic · Efficient · Robust · Outstanding)  # best-of-the-best, unique, months of work, $100,000+
│
├── Good-Enough       # Solid, market-standard, 1–3 weeks, ~$10,000
│
├── Quick-and-Dirty   # Works somehow, fragile, a few days of work, ~$1,000
│
├── Placeholder       # Fake visibility, demo-only, ~$100
│
└── Zero              # Intentionally not implemented, $0
```

---

## Categories

### H. HERO (Holistic · Efficient · Robust · Outstanding)

**Hero** is the highest fidelity level. The function is implemented in a way that no one else has — a unique, outstanding implementation.

- **Holistic** — covers the full scope of the need, well aligned with the other components
- **Efficient** — performs well, optimized, polished
- **Robust** — stable, reliable, handles edge cases
- **Outstanding** — clearly better than alternatives on the market

This level is what makes your product absolutely great and different.

- **Letter** (for genotype abbreviation) : H
- **Implementation time** : several months of experimentation, development, testing and polishing
- **Cost** : about **$100,000 or more**. 

It is suitable when the function is a core differentiator and justifies the investment.

---

### G. Good-Enough

**Good Enough** is the level where the implementation is, in principle, the same as most competitors. It is a normal, good level — high quality, solid, but not outstanding in any way.

Most companies on the market operate at this level for most features. The function works well and meets expectations, but does not stand out.

- **Letter** (for genotype abbreviation) : G
- **Implementation time** : about 1–3 weeks (including design, development, testing)
- **Cost** : about **$10,000**

---

### Q. Quick-and-Dirty

**Quick and Dirty** is the level when we implement something very quickly, without trying too hard. It may have errors and is not robust enough — there can be unstable situations, things may break.

But the function works somehow. It is implemented in a hurry, suitable for validation or early-stage use.

- **Letter** (for genotype abbreviation) : Q
- **Implementation time** : a few days (one, two, or a few days)
- **Cost** : about **$1,000**

---

### P. Placeholder

**Placeholder** is the level of fake visibility — the illusion of a real function. It creates the appearance that the function exists in the product, but it does not actually work.

Examples:
- A button visible on the screen that cannot be clicked
- A UI element shown in a demo that does nothing
- "Fake it till you make it" — for demonstrations, testing, showing to clients, or sales

This level does not allow performing any real function. It is useful for prototyping, demos, and testing demand before investing in real implementation.

- **Letter** (for genotype abbreviation) : P
- **Implementation time** : minimal
- **Cost** : about **$100**

---

### Z. Zero

**Zero** is the level when we decide **not to implement** the function at all. It is not implemented; we consciously choose to do nothing for this function.

- **Letter** (for genotype abbreviation) : Z
- **Implementation time** : none
- **Cost** : **$0**

This is a deliberate choice — we accept that the function is absent and may address the need in other ways (e.g., manual process, future roadmap) or not at all.
