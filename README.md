# aeo-geo-analyzer

Two Claude Code skills that audit content for **Answer Engine Optimization (AEO)** and **Generative Engine Optimization (GEO)** — so it ranks better in AI search surfaces like **ChatGPT, Perplexity, Claude, Gemini, and Google AI Overviews**.

Traditional SEO ranks pages. AEO/GEO ranks **passages** — the specific paragraphs, lists, quotes, or short posts that an LLM lifts into its answer with a citation. These skills score your content against that bar and produce concrete, page-level edits — not generic advice.

## Install (one line)

```bash
curl -fsSL https://raw.githubusercontent.com/aidan269/aeo-geo-analyzer-plugin-/main/install.sh | bash
```

This installs both skills into `~/.claude/skills/`, re-runnable to update. Restart Claude Code (or start a new conversation) and the skills load automatically.

If you'd rather not pipe `curl` to `bash`, download `install.sh` first and inspect it — it's ~50 lines of plain `git clone` + `cp`.

## What's inside

This repo ships two sibling skills:

### `aeo-geo-analyzer` — longform pages, blog posts, articles
Scores any web page (URL) or pasted draft against a 0–100 citation-worthiness rubric with six sub-scores: direct-answer-up-front, statistics-and-evidence, structure, authority/E-E-A-T, freshness, topical depth. Produces 3–7 page-level edits per page in the format `Issue → Current text (exact quote) → Suggested rewrite → Why this helps`. Also generates 5–10 ranked topic recommendations for the coming week, each with a draft H1 and a 40-word draft TL;DR that is itself citation-worthy.

Triggers automatically on phrases like *"audit my blog for AI search,"* *"why isn't my page getting cited by ChatGPT,"* *"score this article for citation-worthiness,"* or *"give me topic ideas to rank in AI Overviews."*

### `aeo-short-form` — tweets, threads, LinkedIn posts
Different rubric, tuned for short content: self-contained claim, first-line hook, in-text source naming (not behind a link), image alt text, thread reorderability. Audits draft posts before publishing or scores published posts for citation profile.

Triggers on phrases like *"score my tweet,"* *"would Perplexity cite this thread,"* *"review my LinkedIn draft,"* or any time you paste short social content and ask for feedback.

Both skills deliberately **ignore classic SEO checklist items** (keyword density, meta descriptions, link-building, engagement-bait advice) unless they directly affect AI citation behavior.

## How to use

In any Claude Code conversation, ask in plain language. The skills trigger automatically:

```
"Audit https://blog.example.com/post for AEO"
"Why isn't my blog getting cited by ChatGPT?"
"Score this draft for citation-worthiness:
<paste>"
"Would AI cite this tweet?
<paste>"
"Give me topic ideas to rank in AI Overviews"
```

On the first longform run, the analyzer asks for your domain, 3–5 priority topic clusters, and 1–3 competitors currently winning AI citations — and saves your answers to `aeo-config.md` so weekly runs don't re-ask.

## Repo layout

```
aeo-geo-analyzer-plugin-/
├── install.sh                                  ← one-line installer
├── .claude-plugin/plugin.json                  ← plugin manifest
└── skills/
    ├── aeo-geo-analyzer/
    │   ├── SKILL.md
    │   └── references/
    │       ├── scoring-rubric.md               ← 0–100 longform rubric
    │       ├── citation-patterns.md            ← 8 reward + 8 anti-patterns
    │       ├── topic-research.md               ← finding query gaps
    │       └── report-template.md              ← weekly report shape
    └── aeo-short-form/
        ├── SKILL.md
        └── references/
            ├── scoring-rubric.md               ← 0–100 short-form rubric
            └── patterns.md                     ← short-form rewards + anti-patterns
```

Both skills follow progressive disclosure — only `SKILL.md` loads by default; references load only when needed.

## Manual install (if you skip the one-liner)

```bash
git clone https://github.com/aidan269/aeo-geo-analyzer-plugin-.git
cp -R aeo-geo-analyzer-plugin-/skills/aeo-geo-analyzer ~/.claude/skills/
cp -R aeo-geo-analyzer-plugin-/skills/aeo-short-form ~/.claude/skills/
```

Restart Claude Code and you're done.

## License

MIT. See [LICENSE](LICENSE).

## Contributing

Issues and PRs welcome. Particularly useful: real-world examples of pages or posts that earned AI citations (or failed to), so the rubrics can be sharpened against ground truth.
