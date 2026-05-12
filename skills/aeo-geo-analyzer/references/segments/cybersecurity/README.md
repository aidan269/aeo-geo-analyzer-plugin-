# Cybersecurity Segment Overlay

The generic AEO/GEO rubric scores any longform passage. Cybersecurity content has additional citation-worthiness signals — CVE references, CVSS vectors, ATT&CK technique IDs, threat-actor naming, disclosure timelines — that the generic rubric misses. This overlay adds them.

Apply this overlay in addition to (not instead of) the base rubric. It produces:
- A detected **content type** (incident report, CVE explainer, threat-actor profile, defensive guide, runbook, advisory, post-mortem, news roundup, tool comparison, research piece) — see `content-types.md`.
- A detected **persona** (SOC analyst, CISO, IT ops, developer/appsec, executive, general reader, compliance officer) — see `content-types.md`, persona section.
- A **signal checklist** of cybersec-specific facts that should appear on this page given its type — see `signals.md`.
- **Word-level swaps** specific to cybersec writing — see `word-swaps.md`.

## When to apply

Apply this overlay when **any of** the following are true:

- The page mentions a CVE ID (regex: `CVE-\d{4}-\d{4,7}`).
- The page covers a named breach, vulnerability, exploit, threat actor, malware family, or defensive technique.
- The page mentions an authoritative cybersec source by name: CISA, MITRE, NIST, NCSC, ENISA, FIRST, KEV catalog, EPSS, NVD, or a named vendor security advisory (Microsoft MSRC, Cisco PSIRT, Adobe security bulletins, etc.).
- The domain is a recognized security publication (e.g., ahackaday.news, BleepingComputer, The Hacker News, Krebs on Security, vendor security blogs, security research labs).
- The author byline names a security firm, lab, or established researcher.

If you cannot identify the content type with confidence after reading the page, ask the user — do not guess.

## How to apply

1. **Detect the segment.** Run the checks above. If positive, proceed.
2. **Identify content type and persona** using the taxonomies in `content-types.md`. State the detected type and persona at the top of the per-page output so the user can correct you if wrong.
3. **Score the base rubric** as usual (see `../scoring-rubric.md`). Then apply the per-type rubric extensions in `content-types.md` — these adjust sub-score weights or add a 0–10 segment-specific sub-score on top.
4. **Run the signal checklist** in `signals.md`. For each signal expected for this content type, mark it present / partial / absent on the page. Missing high-weight signals become specific recommendations.
5. **Add cybersec word swaps** from `word-swaps.md` to the standard word-swaps pass (`../word-swaps.md`). These are categorical additions — "hackers" → name the actor, "a vulnerability" → name the CVE, etc.
6. **Output** per the report template, with the cybersec block (segment, persona, signal checklist) inserted under the per-page audit.

## Cantina / threat-intel specifics

Cantina-adjacent content (ahackaday.news, the security audit firm work, customer research) tends to fall into a small number of content types: **incident report** (most common on ahackaday), **CVE explainer**, **runbook**, **advisory rollup**, and **research piece** (audit firm output). Use those as priors when classifying borderline pages.

The threat-intel audience for ahackaday is overwhelmingly **SOC analyst** and **detection engineer** — the rubric weight on Authority and Topical depth matters less for them than the weight on Signal coverage and Structure. The CISO / executive persona is a secondary audience that the same page may also need to serve; flag pages where the SOC layer is strong but the executive-summary layer is missing.
