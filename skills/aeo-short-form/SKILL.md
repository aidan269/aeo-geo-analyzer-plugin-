---
name: aeo-short-form
description: Audit short-form social content — single tweets, threads, LinkedIn posts, Bluesky posts, Mastodon posts, Reddit comments — for citation-worthiness in AI search and conversational AI surfaces (Perplexity, ChatGPT browsing, Grok, Claude). Different rubric from longform AEO/GEO because short content has different optimization criteria: self-contained claim, first-line hook, in-text source naming, image alt text. Use this skill whenever the user asks about ranking tweets in AI search, getting tweets cited by Perplexity, optimizing a thread for AI, making LinkedIn posts citation-worthy, or wants to review a draft tweet, draft thread, or draft post before publishing. Also trigger when the user pastes social content (with or without saying "tweet") and asks for feedback, optimization, or a citation-worthiness score. Trigger even if the user does not say "AEO" or "GEO" — phrases like "is this tweet good," "would AI cite this thread," "make this post more LLM-friendly," or "score my LinkedIn draft" all qualify.
---

# AEO / GEO — Short-Form Content Analyzer

Audits short-form social content (tweets, threads, LinkedIn posts, etc.) for citation-worthiness in AI search and conversational AI surfaces. Sibling skill to `aeo-geo-analyzer` (which handles longform pages and blog content).

## Why this matters and why it's different from longform

Perplexity, ChatGPT with browsing, Grok, Bluesky's AI features, and Claude search all surface social posts as citations — but not in the same way they surface articles. A tweet is cited when it is **self-contained, attributable, and specific** in a way that a 280-character constraint makes brutally difficult. Longform AEO rubrics (H2 question subheads, FAQ blocks, schema markup) do not apply.

The short-form rubric optimizes for different things:
- Can a single post stand alone as a citable claim?
- Does the first ~140 chars deliver the substantive idea?
- Is the source of any claim named *in the post*, not in a link?
- For threads, does each post survive being lifted out of order?
- For posts with images, does the alt text carry information?

## Inputs

Accept any of:
- **A single draft post** — most common, pre-publication review
- **A draft thread** (numbered tweets, or a list separated by "---" or blank lines)
- **A published post URL** (Twitter/X, LinkedIn, Bluesky, Mastodon, Reddit)
- **A list of recent posts** to audit the account's overall citation profile
- **A topic** the user wants to post about, without existing content

Also ask, on the first run only:
- The account's brand/persona and one-line positioning
- Whether the goal is single-post citations or thread-level coverage
- Platform constraints (X has different norms from LinkedIn)

Save these to `aeo-short-form-config.md` if the user wants recurring reviews. Most use is one-off draft review.

## Workflow

### 1. Identify the input type

Short content is unambiguous — you can usually tell from length and formatting. For URLs, fetch the post via WebFetch (X and LinkedIn often render fine; many posts may be inaccessible without auth, in which case ask the user to paste).

### 2. Score against the short-form rubric

Read `references/scoring-rubric.md` and score the content on six dimensions producing a 0–100 score:

- **Self-contained claim** (0–25) — can a single post be lifted and cited without losing meaning?
- **Specificity / named evidence** (0–20) — stats, named sources, dates, attributed quotes inside the post itself (not in a link)
- **First-line hook** (0–15) — does the first ~140 chars deliver the substantive claim, not just a tease?
- **Authority signals** (0–15) — named author, credentials in the post or bio, verified context, source link
- **Topical fit / query match** (0–15) — does the post clearly address a topic users would ask AI engines about?
- **Format hygiene** (0–10) — image alt text, thread coherence (each post stands alone), no broken pronouns or unresolved references

For threads, score each post individually *and* score the thread as a whole. A thread averaging 60/100 with one post at 90 is more useful than a thread averaging 75 with everything middling — the standout post is what gets cited.

### 3. Generate concrete rewrites

For each scored post, produce 2–4 concrete rewrites. Format:

> **Issue:** \<one-line description of what is hurting citation-worthiness\>
> **Current:** "\<exact text of the post or relevant span\>"
> **Rewrite:** "\<rewritten post that fits the platform's character limit\>"
> **Why this helps:** \<one sentence tying to AEO/GEO behavior\>

Always respect platform character limits when rewriting:
- X / Twitter: 280 chars (free tier) or 25,000 chars (premium) — ask if you don't know
- LinkedIn: 3,000 chars; first ~210 chars matter most (the "see more" cutoff)
- Bluesky: 300 chars
- Mastodon: 500 chars (default; varies by instance)
- Reddit: long, but first ~200 chars dominate scanning behavior

If a rewrite exceeds the limit, propose a thread-split instead of a single post.

### 4. Suggest thread restructuring (if applicable)

For draft threads, identify whether any post would gain by:
- Being moved to position 1 (highest-citation slot)
- Being split into two posts (because it tries to do two things)
- Being merged with an adjacent post (because it stands alone weakly)
- Being deleted (because it adds no citable claim)

A common pattern: the strongest standalone claim is buried in tweet 4 of a 10-tweet thread. Move it to tweet 1.

### 5. Deliver the report

For a single post: a short scored summary + rewrites, no full report template.

For a thread: a per-post score table, then rewrites and restructuring recommendations, then a thread-level diagnosis.

For an account-level audit: read `references/account-audit-format.md` for the multi-post template.

## Reference files

- `references/scoring-rubric.md` — the 0–100 short-form rubric with detailed sub-score criteria
- `references/patterns.md` — reward patterns and anti-patterns specific to short-form

## Traps to avoid

1. **Engagement-bait advice.** "Add a hook," "use more emojis," "tag big accounts" — these may boost engagement but do not move citation-worthiness. The two are different goals and frequently in tension. Stay focused on what makes a post *citable*, not what makes it *shareable*.

2. **Longform-brain.** Do not recommend FAQ blocks, schema markup, or H2 subheads. Wrong rubric. If the user genuinely needs longform optimization, switch them to the `aeo-geo-analyzer` skill.

3. **Platform-blind rewrites.** A LinkedIn rewrite reads differently from a tweet rewrite. Tone, length, formatting conventions all differ. Ask which platform if it is not obvious from the input.

4. **Citing the unlinkable.** AI engines vary on which platforms they can cite. X posts get cited heavily by Perplexity; private LinkedIn posts almost never. Adjust expectations accordingly and tell the user when the underlying platform is the bottleneck.
