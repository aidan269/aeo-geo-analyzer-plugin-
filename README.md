# aeo-geo-analyzer

A Claude Code plugin that audits website and blog content from an **Answer Engine Optimization (AEO)** and **Generative Engine Optimization (GEO)** perspective — so it ranks better in AI search surfaces like **ChatGPT, Perplexity, Claude, Gemini, and Google AI Overviews**.

Traditional SEO ranks pages. AEO/GEO ranks **passages** — the specific paragraphs, lists, or quotes that an LLM lifts into its answer with a citation. This plugin scores your content against that bar and produces page-level edits, not generic advice.

## What it does

Given one or more URLs (or a sitemap), the skill produces a weekly report containing:

- **Citation-worthiness score (0–100)** for each page, with six sub-scores: direct-answer-up-front, statistics-and-evidence, structure, authority/E-E-A-T, freshness, topical depth.
- **3–7 concrete edits per page**, each in the form: `Issue → Current text (exact quote) → Suggested rewrite → Why this helps`. Hand them to a writer with no further translation.
- **5–10 ranked topic recommendations** for the coming week — each with a target query, a draft H1, and a 40-word draft TL;DR that is itself citation-worthy.
- **Cross-page patterns and trends** so you can spot template-level fixes that lift every page at once.

It deliberately **ignores classic SEO checklist items** (keyword density, meta descriptions, link-building) unless they directly affect AI citation behavior. Schema markup, named statistics, dated sources, and question-shaped subheads matter; meta keywords and H1 stuffing do not.

## Install

### Option A — drop into your skills directory

```bash
git clone https://github.com/aidan269/aeo-geo-analyzer-plugin-.git
cp -R aeo-geo-analyzer-plugin-/skills/aeo-geo-analyzer ~/.claude/skills/
```

Restart Claude Code. The skill is now available globally.

### Option B — install as a Claude Code plugin

If you have a Claude Code marketplace configured, add this repo and run:

```
/plugin install aeo-geo-analyzer
```

## How to use it

In any Claude Code conversation, just ask in plain language:

- "Audit these URLs for AEO: ..."
- "Why isn't my blog getting cited by ChatGPT?"
- "Score this page for citation-worthiness."
- "Give me topic ideas to rank in AI Overviews."

The skill triggers automatically on phrases like *AEO*, *GEO*, *AI search*, *cited by ChatGPT*, *LLM-friendly content*, *citation-worthy*, or *rank in AI Overviews* — even when those exact terms aren't used.

On the first run it will ask for:

1. Your domain and one-line positioning
2. 3–5 priority topic clusters
3. 1–3 competitors currently winning AI citations for your target queries

It saves these to `aeo-config.md` in your working directory so weekly runs don't re-ask.

## What's inside

```
aeo-geo-analyzer/
├── SKILL.md                      ← workflow, traps to avoid, when to trigger
└── references/
    ├── scoring-rubric.md         ← 0–100 rubric with six sub-scores
    ├── citation-patterns.md      ← 8 patterns LLMs reward + 8 anti-patterns
    ├── topic-research.md         ← how to find query gaps in AI engines
    └── report-template.md        ← weekly report markdown structure
```

The skill follows progressive disclosure: only `SKILL.md` is loaded by default; the references are read only when needed.

## License

MIT. See [LICENSE](LICENSE).

## Contributing

Issues and PRs welcome. Particularly useful: real-world examples of pages that earned AI citations (or failed to), so the rubric can be sharpened against ground truth.
