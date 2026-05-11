# Word-Level Swaps (longform)

A catalog of specific weak words and phrases that hurt citation-worthiness, with stronger alternatives. Word-level swaps are the cheapest possible edit — usually a single find-and-replace — and they affect every passage on the page at once. Apply them in addition to (not instead of) the page-level rewrites in `citation-patterns.md`.

For each category below, surface 1–4 specific swaps actually present on the page being audited. Quote the exact phrase the user used; do not invent examples.

---

## 1. Hedges → direct claims

Hedging language is the single most common citation-killer in technical writing. LLMs down-weight hedged passages because citing them would force the model to hedge its own answer.

| Weak | Stronger (if evidence supports) | Stronger (if evidence is genuinely uncertain) |
|---|---|---|
| may, might, could | does, will | "remains unconfirmed" + name what's missing |
| possibly, potentially, perhaps | — drop entirely — | "no public reports of X as of YYYY-MM-DD" |
| seems to, appears to | is | "early reports suggest" + named source |
| it is believed that | name who believes it | drop |
| likely, probably | name the probability, or drop | "the available evidence points to X, though Y is not ruled out" |
| in some cases | name the case | "of N observed cases, M had this property" |
| often, frequently | name the rate | replace with a number |

**Apply rule:** if a sentence has two or more hedges in it, rewrite the sentence. One hedge can sometimes be load-bearing; two is always padding.

## 2. Vague intensifiers → specific qualities

Intensifiers signal effort, not information. AI engines learn to ignore them.

| Weak | Stronger |
|---|---|
| very critical | name the CVSS, the blast radius, or the count of affected systems |
| extremely important | name what depends on it |
| highly recommended | by whom, in what guidance |
| significant | name the magnitude |
| substantial | a number |
| widely | quantify |
| dramatically | name the before/after delta |

**Apply rule:** anywhere "very" or "extremely" appears, the writer almost certainly knows the specific quality they meant — coach them to name it.

## 3. Dead verbs → named verbs

The verbs *uses, has, is, does, makes, provides, offers, includes* carry no information. Replacing them with a specific verb increases citation-worthiness because the resulting sentence describes a mechanism rather than a state.

| Dead | Named (examples — depends on context) |
|---|---|
| X uses encryption | X encrypts data at rest with AES-256 |
| X has authentication | X authenticates via OAuth 2.0 / SAML / etc. |
| X is fast | X serves median requests in 12ms |
| X provides protection | X blocks / detects / quarantines |
| X includes features | X ships with [named feature], [named feature] |
| X makes it easy | X reduces setup from N steps to M |

## 4. Unsourced attributions → named sources

"Studies show," "experts agree," "industry research" are negative signals to citation engines — they read as fluff.

| Weak | Stronger |
|---|---|
| studies show | name the study (author, year, journal, sample size if relevant) |
| experts say | name the expert and their affiliation |
| industry research suggests | name the firm and the report title + year |
| it is widely believed | drop, or name who believes it |
| reports indicate | name the report and its publisher |
| analysts predict | name the analyst firm and the analyst |
| many companies | name them, or replace with a number from a survey |

If the user cannot name a source for a claim, that's itself a topic recommendation — they need to find or generate the evidence.

## 5. Filler nouns → specific terms

| Weak | Stronger (examples) |
|---|---|
| things, stuff | the actual noun |
| aspects, elements, factors | name them |
| solutions, options | name the products, methods, or approaches |
| issues, concerns | name the failure mode |
| considerations | drop, replace with the consideration |
| capabilities | name what it does |
| insights | name what was learned |

## 6. Time anchors → dated claims

Vague time language goes stale instantly; AI engines down-weight stale-feeling content.

| Weak | Stronger |
|---|---|
| recently, lately, currently | the specific date or version |
| the new flaw | "CVE-2026-XXXX, disclosed 2026-05-04" |
| modern, today's | name the year or version threshold |
| now | "as of 2026-05-04" |
| soon | name the expected date |
| in recent years | "since [year]" |

This is especially important for security and tech content where the field moves and stale citations become wrong citations.

## 7. Cause-effect weasels → named mechanisms

| Weak | Stronger |
|---|---|
| may lead to | causes (if true), or "in N of M observed cases, X resulted in Y" |
| is associated with | name the mechanism, or specify it as correlation only |
| can result in | "results in" + the specific output |
| has been linked to | name the linking study |
| contributes to | name the contribution magnitude |

## 8. Brand-voice fluff → topic content

These should be cut entirely rather than replaced — they take up early-page real estate where the answer should live.

- "In this post, we will explore…" → cut, lead with the answer
- "We are excited to announce…" → "X ships [date]" + the substantive change
- "Our team at <Brand>…" → cut from intro; restore in the byline
- "It's important to understand…" → cut; the importance is implied by the content
- "Without further ado…" → cut

---

## Output format

Surface 5–15 specific swaps per page, organized by category, only including swaps where the weak phrase actually appears on the page. Format:

```
### Hedges (3 found)
- "may have been exploited"  →  "remains unconfirmed as exploited" or "was exploited" if Trellix's filing confirms.
- "appears to affect"  →  "affects" — the advisory is explicit.
- "in some cases"  →  "in 3 of the 5 reported cases" — the source quantifies this.

### Unsourced attributions (2 found)
- "studies show"  →  name: "the 2025 OWASP review of 200 web apps."
- "experts agree"  →  drop, or quote a named CVE-numbering authority.

### Time anchors (1 found)
- "the new MOVEit flaw"  →  "CVE-2026-XXXX, disclosed 2026-05-04."
```

If a category has zero hits on the audited page, omit the category from the output — do not pad with empty sections.
