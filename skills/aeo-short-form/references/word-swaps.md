# Word-Level Swaps (short-form)

Word-level swaps tuned for tweets, threads, and LinkedIn posts. The categories overlap with the longform list but the priorities differ — in 280 characters, every weak word costs more than it does in 2,000.

Surface 3–8 specific swaps per post (or per thread), only quoting phrases that actually appear in the content. For threads, note which post each swap belongs to.

---

## 1. Tease openers → claim openers

Short-form's highest-leverage swap. The first ~140 chars is the prime citation slot; spending it on a tease throws away the slot.

| Tease | Claim |
|---|---|
| "Buckle up" / "Wild story" | the substantive lead in one sentence |
| "🧵 Thread" / "1/" | the strongest standalone claim from the thread, moved to position 1 |
| "You won't believe…" | the thing they won't believe, stated outright |
| "Hot take:" | name the take; drop the "hot take" framing |
| "Wait until you see this" | what you want them to see |
| "Big news today" | the news |
| "Interesting development" | the development, named |
| "PSA:" | the actual public-service message |

**Apply rule:** if you can cut the opener and the next sentence still leads the post, cut it.

## 2. Unresolved pronouns → named subjects

The most underrated short-form anti-pattern. A tweet starting with "they," "this," or "what's happening" reads fine in the timeline because the timeline supplies context — but it breaks completely when an AI engine lifts the tweet without that context.

| Weak | Strong |
|---|---|
| "they just admitted…" | "<company name> just admitted…" |
| "this is huge" | name the thing |
| "what's happening right now" | name the event with a date |
| "the breach" | "the <vendor> <date> breach" |
| "the new flaw" | "CVE-XXXX-XXXXX in <product>" |
| "this guy" / "this person" | the person's name and role |

**Apply rule:** read the post out loud to someone who has not been online today. Every "they" / "this" / "what's happening" they have to ask about is a citation killer.

## 3. Hedges → direct claims

Same list as longform, but compressed. In 280 chars, a hedge is more expensive — it eats space that should hold the claim.

| Weak | Strong |
|---|---|
| may, might, could | does (if true) / drop |
| seems to | is |
| possibly, potentially | drop |
| likely, probably | name the basis or drop |

For draft tweets, count the hedges. A tweet with two hedges is rarely citable — rewrite the claim with more confidence (and if the evidence does not support that, the post probably should not ship).

## 4. Vague intensifiers → specific qualities

| Weak | Strong |
|---|---|
| "very important" | name what depends on it |
| "huge" / "massive" | a number |
| "critical" (when used loosely) | the CVSS score, the affected count, or "rated critical by <source>" |
| "game-changing" | the change, named |
| "insane" / "wild" | name what makes it so |

Drop them when you cannot replace; they are pure padding.

## 5. Generic CTAs → claim closes

The closing position is the second-most-cited slot. Wasting it on engagement bait costs you.

| Weak | Strong |
|---|---|
| "Drop a 🔥 if you agree" | drop, end on the substantive claim |
| "RT to spread the word" | drop |
| "What do you think?" | drop, or replace with a specific question that invites a citable response ("which CVSS scoring method should this use?") |
| "Follow for more" | drop |
| "Thoughts?" | drop |

**Apply rule:** close on the most specific noun phrase in the post. CTAs belong nowhere near it.

## 6. Time anchors → dated claims

In short-form, dates matter more because the content rotates faster and the engagement window is short.

| Weak | Strong |
|---|---|
| "today" / "just now" | the date + UTC time if material |
| "the new" + thing | the version, CVE, or named identifier |
| "recently" | the specific date |
| "soon" | the named date |

## 7. Filler verbs in short content

| Weak | Strong (in context) |
|---|---|
| "happens" | name what happens |
| "going on" | what is going on, named |
| "stuff" | the actual thing |
| "things" | the actual thing |
| "got" | a specific verb |
| "doing" | a specific verb |

In 280 chars there is no room for a verb that does no work. Replace.

## 8. Hashtag and emoji noise

These do not hurt as much as people think for casual posts, but they hurt citation-worthiness in two cases:

- Hashtag dump at the end of a substantive post → drop down to 1–2 relevant tags or none. AI engines treat hashtag walls as low-quality signals.
- Emoji that replace nouns → "the 🚨 dropped today" → "the CVE dropped today, advisory at <url>." Emoji-as-noun reads as evasive.

Emoji as decoration is neutral; emoji as content substitution is a flag.

---

## Output format

Surface 3–8 swaps per post, grouped by category. For threads, note the post number:

```
POST 1
### Tease opener (1)
- "Buckle up — wild story incoming 🧵"  →  "Trellix just disclosed a source-code-repo breach; their 8-K names <details>."

### Unresolved pronoun (1)
- "they admitted today"  →  "Trellix admitted today (2026-05-04)"

POST 3
### Hedge (1)
- "may have been exploited"  →  "no public reports of exploitation as of 2026-05-04" (if true).
```

Skip categories with zero hits. Do not invent weak phrases the user did not write.
