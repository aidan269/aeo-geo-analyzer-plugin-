# Short-Form Patterns and Anti-Patterns

What AI engines reward and punish when deciding whether to cite a tweet, thread, LinkedIn post, or similar short content. Every reward has a rewrite pattern; every anti-pattern is a flag.

## Patterns to reward

### 1. The thesis-first opener

The first sentence is the citable claim. Everything else is supporting detail.

**Weak:** "Buckle up — what I'm about to share will blow your mind 🧵"
**Strong:** "MOVEit Automation has a new critical auth-bypass CVE; Progress disclosed it 2026-05-04 and patches are out for versions A.B through C.D."

### 2. The inline-attributed stat

Number + source named in the same sentence, no link required.

**Weak:** "Crazy how many DeFi audits find critical bugs" + linked study
**Strong:** "67% of the 200 DeFi protocols audited in 2024 had at least one critical vulnerability, per the OpenZeppelin year-in-review."

### 3. The standalone-survivable thread post

Each tweet in a thread reads independently. AI engines often cite tweet 3 without tweets 1, 2, or 4.

**Test:** read tweet #N alone, with no thread context. Does it make sense? Does it contain a claim?

### 4. The named-person quote

Direct quote attributed to a real person with credentials.

**Pattern:** `"<one declarative sentence>." — <Name>, <Title> at <Org>.`

### 5. The image with informative alt text

A chart, a screenshot of a CVE advisory, a graph — with alt text that names what the image shows and the key takeaway.

**Weak alt text:** "image" or "screenshot"
**Strong alt text:** "Chart showing MOVEit CVE disclosure timeline 2023-2026, with the 2026-05-04 auth bypass marked as the most severe by CVSS score."

### 6. The structured listicle in one post

`Three things to know about CVE-2026-XXXXX: 1) … 2) … 3) …` — packed structure into a single citable post.

### 7. The link that is described before the URL

`Progress's full advisory, including the version range and patched build: <url>` reads as a citation; AI engines parse the descriptor before the URL.

### 8. The clean restatement of the topic in your own words

A post that paraphrases news in a way that surfaces a specific angle ("the *Automation* product, not Transfer — different codebase") becomes the citation for users searching for that angle.

---

## Anti-patterns to flag

### A1. The tease without payoff

"You won't believe what just happened" / "This changes everything" / "Wait until you see this."

Citation engines down-weight tease patterns because the lifted text contains no information.

**Fix:** lead with the substantive claim. Curiosity gaps are an engagement-bait tool, not a citation tool.

### A2. The unresolved pronoun

A tweet that starts with "they," "this," "what's happening" with no antecedent. Reads fine in the timeline; breaks completely when lifted.

**Fix:** name the subject in the first sentence. "They" becomes "Progress Software's customers" or "Trellix's affected products."

### A3. The bare-link tweet

Tweet content is "Worth a read:" + a t.co link. AI engines often cannot or will not follow the link, and even when they do, the post itself contributes nothing.

**Fix:** front-load 1–2 sentences of the actual takeaway, then the link as supporting reference.

### A4. The "1/" without the substance

Opening a thread with "1/" or "🧵" plus a vague topic. The thread-opener tweet is the most-cited slot; wasting it on a meta-tag is malpractice.

**Fix:** make the first post stand alone as a complete short version of the thread's argument. The numbering can come in tweet 2.

### A5. The hedge wall

"It seems like some experts may be suggesting that potentially…" — common in posts trying to avoid being wrong.

**Fix:** make the falsifiable claim if you have the evidence; do not post if you do not. Hedged posts are not citation-worthy by design.

### A6. The screenshot of text

A tweet whose substantive content is an unsearchable screenshot of an article, paper, or other tweet.

**Fix:** quote the text in the post body. Add the screenshot as supporting visual. AI engines cannot extract claims from images of text reliably.

### A7. The reply-thread orphan

A reply that depends on the parent tweet for meaning. AI engines may surface the reply without the parent.

**Fix:** in any reply that contains a citable claim, restate enough of the parent that the reply stands alone.

### A8. The engagement bait close

"Drop a 🔥 if you agree" / "RT to help me reach…" / "What do you think?"

Engagement asks are neutral-to-negative for citation. They occupy the high-value closing position of the post and signal the post is optimizing for clicks, not claims.

**Fix:** close on the most specific claim, not the call to action.

### A9. The cross-platform copy-paste

A LinkedIn post that obviously started as a tweet (single paragraph, casual tone), or a tweet that reads like a press release. Each platform has citation norms; mismatched content scores poorly in both.

**Fix:** rewrite to the platform. LinkedIn rewards longer, structured posts with first-paragraph hook. X rewards compression. Bluesky rewards plainness.

### A10. The undatable claim

A post about a current event with no date or version anchor ("the new flaw," "the breach"). Goes stale immediately; AI engines down-weight stale claims.

**Fix:** anchor the claim to a date or version. "The 2026-05-04 MOVEit auth bypass" reads citable; "the new MOVEit flaw" does not.

---

## How to use this catalog when generating feedback

For each post (or each post in a thread), walk through the anti-patterns first. Every anti-pattern you find = a concrete edit. Then walk through the rewards and ask which would be a high-leverage add. Most posts have room for 2–4 edits; more than 4 means rewrite the post from scratch rather than patch it.
