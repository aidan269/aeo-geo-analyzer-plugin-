# Short-Form Citation-Worthiness Rubric (0–100)

Six sub-scores. Total = sum. Score what is in the post right now, not what could be there with edits.

The headline number is less informative than the sub-scores. A 60/100 with a 5/25 on self-contained-claim needs a different rewrite from a 60/100 with a 5/15 on first-line-hook.

For threads, score each post individually using this rubric, then add a thread-level note covering coherence and reorderability.

---

## 1. Self-contained claim (0–25)

The most important short-form factor. If a passage cannot stand alone when an AI engine lifts it, the engine will not lift it.

- **25** — The post makes one specific, factual claim that survives being quoted with no surrounding context. A reader who has never seen the rest of the thread or the author's prior posts can still understand and verify it.
- **18** — Clear claim, but requires a small piece of context (a name, a date, an event reference) that a moderately informed reader can fill in.
- **12** — Claim is present but depends on context the reader probably does not have ("this," "they," "what happened today").
- **6** — Reaction or commentary on something not stated in the post.
- **0** — Purely vibes — no claim to extract.

Test: read the post out loud to someone who has not been on the internet today. Do they understand and is the claim falsifiable? If yes → high score. If they need to ask "who?" or "what?" → low score.

## 2. Specificity / named evidence (0–20)

Named numbers, named sources, named people, named dates — *inside the post*, not in a link the AI engine may or may not follow.

- **20** — Multiple specific facts with named sources or attribution ("the CISA advisory published 2026-05-04," "67% of audited DeFi protocols," "according to Trellix's 8-K filing").
- **14** — One or two specific facts with sources.
- **9** — Specific claim but vague attribution ("a recent study," "experts say").
- **4** — Approximate or unsourced claim.
- **0** — Pure opinion.

Linked sources are not zero — AI engines do sometimes follow links — but a post that names the source inline is several times more citable than one that hides the source behind a t.co link.

## 3. First-line hook (0–15)

Does the first ~140 chars (the visible part on most clients, before "show more" or thread expansion) deliver the substantive idea? Or is it a tease?

- **15** — First sentence states the substantive claim. A reader who stops reading there still got the value.
- **11** — Strong setup that names the topic clearly and previews the specific claim by the second sentence.
- **7** — Generic opener ("buckle up," "thread 🧵," "interesting development today") followed by the actual content.
- **3** — Pure tease ("this changes everything").
- **0** — Misleading or clickbait first line.

AI engines weight opening text heavily because that is what users see in previews and what fits in compact citation windows. A tease is a citation killer no matter how strong the rest of the post is.

## 4. Authority signals (0–15)

Is the source citable from the AI engine's perspective?

- **15** — Named author (real name, not just a handle) with credentials visible in the bio or the post, verified or institutionally-tied account, linked to a credible domain.
- **11** — Real name + bio with credentials; no link to authoritative own work.
- **7** — Handle-only identity, but established account with consistent topical posting.
- **3** — Anonymous handle with no topical history.
- **0** — Anonymous, brand new, or known low-trust signals.

For LinkedIn: title + company + tenure in the post or the byline matter a lot. For X: bio + verification + the account's posting history on the topic. For Bluesky/Mastodon: domain-linked verification is the strongest signal.

## 5. Topical fit / query match (0–15)

Does the post clearly address something users actually ask AI engines about?

- **15** — Clear topic, specific subject (a vendor, a CVE, a product, a person), addresses a question users plausibly query AI for ("what is X," "is X safe," "did X happen").
- **11** — Clear topic but on a niche or noisy query where citation odds are low regardless.
- **7** — Topic emerges only on rereading.
- **3** — Multiple topics in one post, none cleanly.
- **0** — Off-topic or pure meta-content (about the platform itself).

Posts that match conversational query phrasing ("Yes — Trellix did disclose a breach today; here is what was actually accessed:") outperform posts that match keyword phrasing ("Trellix breach 2026 details").

## 6. Format hygiene (0–10)

Platform-specific cleanliness that affects extraction.

- **10** — Images have descriptive alt text. No "1/" prefix without substantive content. Pronouns resolve. Hashtags only where they add discovery value. Links described before the URL, not after. No broken markdown rendering.
- **7** — Mostly clean but missing alt text on a key image or one unclear pronoun.
- **4** — Multiple hygiene issues.
- **1** — Image-only post with no text or alt text.
- **0** — Garbled rendering, broken thread, or content trapped in a screenshot.

Image alt text is the most under-used short-form lever — AI engines can read it, most posts do not have it. A single image with informative alt text can carry a post to citation.

---

## Output format for each scored post

```
POST: <first 80 chars or post ID>
Score: <total>/100
- Self-contained claim:      X/25
- Specificity / evidence:    X/20
- First-line hook:           X/15
- Authority signals:         X/15
- Topical fit:               X/15
- Format hygiene:            X/10

Top 1-line diagnosis: <the single biggest reason this post is or is not citable>
```

For threads, add a final block:
```
THREAD-LEVEL NOTES
- Strongest standalone post: #N (score X/100)
- Recommended reorder: move post #N to position 1, etc.
- Posts that should be merged or cut: ...
- Coherence: do the posts read in order, and does each survive being lifted out of order?
```
