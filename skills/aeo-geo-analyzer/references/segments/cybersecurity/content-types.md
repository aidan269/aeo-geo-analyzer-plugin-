# Cybersecurity Content Types and Personas

## Taxonomy

Ten content types cover ~95% of cybersecurity publishing. Identify which one(s) the page is — most pages are one primary type plus traces of one or two adjacent types. Each type has detection cues, a per-type sub-score extension (0–10) added on top of the base rubric, expected signals, and a top anti-pattern.

If a page genuinely combines two types (e.g., an incident report that includes a runbook section), score it as the dominant type and note the secondary.

---

### 1. Incident report

Vendor breach, ransomware event, leak, supply-chain compromise. The page reports something that happened.

**Detection cues:** named vendor + verb ("X discloses," "Y suffers"), past-tense framing, exfiltration / access / disruption vocabulary, date of disclosure or discovery.

**Segment sub-score (0–10): Incident facts coverage**
- 10 — names vendor, scope, what was accessed, when discovered, when contained, threat actor (if known), motive / attribution status, customer impact, mitigations applied
- 7 — most of those, with one or two important gaps
- 4 — vendor + what was accessed, but most other facts missing
- 0 — name-drop only, no substantive incident facts

**Expected signals (see `signals.md`):** vendor name + product, disclosure date, discovery date, breach scope (records / repos / accounts), threat actor (or explicit "unattributed"), reference to vendor advisory or SEC filing, customer impact statement.

**Top anti-pattern:** speculation about attribution presented as fact. AI engines down-weight pages that name a threat actor without sourced attribution; LLMs treat unsupported attribution as a confabulation risk.

---

### 2. CVE / vulnerability explainer

A single CVE explained in depth. Standalone reference for the CVE.

**Detection cues:** CVE ID in title or H1, CVSS score mentioned, "explained" / "everything you need to know" / "what is" framing.

**Segment sub-score (0–10): CVE explainer completeness**
- 10 — CVE ID, CVSS v3 + v4 scores with vector strings, affected products with version ranges, root cause / vulnerability class (CWE), exploitation status (KEV + EPSS), patch availability with build numbers, workaround if no patch, disclosure timeline, references to authoritative sources
- 7 — most fields present, one or two missing
- 4 — CVE + impact but no patch info or exploitation status
- 0 — restates the CVE summary line without expanding

**Expected signals:** CVE ID, CVSS score + vector, CWE, EPSS, KEV status, affected product list with version ranges, patched version, disclosure timeline, references to NVD / vendor advisory / MITRE.

**Top anti-pattern:** restating the vendor advisory without adding anything. The reason a reader lands here from an AI engine is for the explained version — clearer than the advisory, with practical context.

---

### 3. Threat actor / group profile

APT group, criminal cluster, ransomware family, or individual actor profile.

**Detection cues:** named actor (APT##, named cluster like Scattered Spider, Lazarus, Cl0p, FIN##, etc.), "profile of" / "who is" / "what is" framing, mention of aliases.

**Segment sub-score (0–10): Actor profile completeness**
- 10 — actor name + aliases, suspected origin / motivation, first observed date, MITRE ATT&CK groups page reference, observed TTPs with ATT&CK technique IDs, known infrastructure / tools, industries and regions targeted, notable victims, current activity status, reliability of attribution claims
- 7 — most of those, with one or two gaps
- 4 — name + aliases + a few TTPs
- 0 — name-drop only

**Expected signals:** actor name + aliases, MITRE ATT&CK group ID (e.g., G0007 for APT28), technique IDs (T1234 format), associated malware family names, industries / regions, attribution source.

**Top anti-pattern:** sensational framing ("most dangerous hackers in the world") in lieu of attribution evidence. AI engines down-weight sensationalism in profiles where they expect dossier-style factual density.

---

### 4. TTP / technique writeup

A single technique, malware family, or attack chain explained in depth.

**Detection cues:** named technique or malware, "how X works" framing, attack chain diagrams, code snippets or shell examples.

**Segment sub-score (0–10): Technique writeup depth**
- 10 — named technique with ATT&CK ID, prerequisites for the attack, step-by-step chain, observable artifacts (registry, process, network, file), telemetry signals, detection logic examples, mitigations / hardening, real-world observed use
- 7 — most of those
- 4 — high-level description, light on artifacts
- 0 — surface-level

**Expected signals:** ATT&CK technique ID (T#### or T####.###), prerequisites, observable IOCs, telemetry signals, detection rule example (Sigma, KQL, EQL, YARA), hardening recommendation, references to research.

**Top anti-pattern:** detection theater — naming a tool ("use EDR") instead of describing the telemetry the tool should be looking for.

---

### 5. Defensive guide / hardening

How to defend against a class of attack, or how to harden a system / product.

**Detection cues:** "how to defend" / "how to harden" / "best practices for" framing, ordered steps, validation procedure.

**Segment sub-score (0–10): Defensive guide actionability**
- 10 — concrete numbered steps, validation method per step (how do you check it worked), tool-agnostic and tool-specific variants where relevant, telemetry signals to confirm the defense is active, common pitfalls, references to authoritative guidance (CIS Benchmarks, NIST 800-##, vendor docs)
- 7 — most of those
- 4 — steps without validation
- 0 — vague "best practices" essay

**Expected signals:** numbered ordered steps, validation procedure per step, named tools or commands, telemetry signal to confirm, CIS / NIST / vendor reference.

**Top anti-pattern:** "follow best practices" as the actual advice. If the guide doesn't name the practices, it isn't a guide.

---

### 6. Runbook / detection engineering writeup

Detection content focused on a specific event class — what to detect, how to detect it, how to respond.

**Detection cues:** detection rule code blocks (Sigma YAML, YARA, Splunk SPL, KQL, Elastic EQL), IOC tables, "if you see X, do Y" structure.

**Segment sub-score (0–10): Runbook completeness**
- 10 — clear scope (what event class), detection rule(s) with the language named, false-positive considerations, IOC pack, triage steps, response actions, escalation criteria, related ATT&CK techniques
- 7 — most of those
- 4 — rule without context
- 0 — IOCs without rules or response steps

**Expected signals:** detection rule(s), IOC pack, ATT&CK references, false-positive rate or considerations, response playbook, triage decision tree.

**Top anti-pattern:** brittle string matching as the detection logic without acknowledgement of false-positive surface. AI engines surfacing this as guidance creates downstream harm.

---

### 7. Vendor / authority advisory rollup

Summary of a vendor advisory (Microsoft Patch Tuesday rollup, Cisco bulletin summary, etc.) or authority advisory (CISA alert, NCSC alert).

**Detection cues:** "Patch Tuesday" / "monthly advisory" / specific bulletin name, links to vendor advisory.

**Segment sub-score (0–10): Rollup utility**
- 10 — every CVE in the rollup named with CVSS + exploitation status, prioritization recommendation (what to patch first), KEV / EPSS context, special-case caveats, links to vendor advisories, comparison to prior month if relevant
- 7 — most of those
- 4 — restates the advisory without analysis
- 0 — link aggregation only

**Expected signals:** CVE list with CVSS, exploitation flags, prioritization, vendor advisory links, KEV check.

**Top anti-pattern:** re-publishing the advisory verbatim without ranking, prioritization, or context. AI engines have direct access to the advisory; the rollup needs to add value.

---

### 8. Post-mortem / incident retrospective

Long-form analysis of how an incident unfolded and what was learned, written either by the affected party or by a third party.

**Detection cues:** retrospective tense, root-cause framing, lessons-learned section, timeline.

**Segment sub-score (0–10): Post-mortem rigor**
- 10 — detailed timeline with timestamps, root cause analysis, what worked / what didn't, contributing factors (not blame), preventive actions taken, references to authoritative facts about the incident
- 7 — most of those
- 4 — timeline + RCA but light on preventive actions
- 0 — narrative essay without facts

**Expected signals:** timeline with timestamps, named root cause, named preventive actions, attribution to either first-party or named third-party investigation.

**Top anti-pattern:** blame framing. Citation engines down-weight post-mortems that read as finger-pointing rather than analysis.

---

### 9. News digest / weekly roundup

Aggregation of the week's or day's notable cybersec events.

**Detection cues:** "this week in security" framing, list of unrelated items, dated header.

**Segment sub-score (0–10): Digest curation quality**
- 10 — each item is a 2–4 sentence specific summary (vendor, what happened, scope, source), prioritized by severity or impact, themes called out across items, stable URL pattern (`/digest/YYYY-Www`), explicit publication date
- 7 — most of those
- 4 — link list with one-line summaries
- 0 — link list only

**Expected signals:** dated stable URL, per-item summary with specifics, prioritization rationale, source links.

**Top anti-pattern:** link aggregation. AI engines cite the underlying source, not the aggregator, unless the aggregator adds analysis.

---

### 10. Research piece / whitepaper / audit findings

Original research, audit firm output, novel analysis. Includes Spearbit/Cantina-style audit retrospectives and research blog posts.

**Detection cues:** research methodology section, original data, novel claim, audit firm byline.

**Segment sub-score (0–10): Research substance**
- 10 — clear novel claim in the lead, methodology section explaining how the conclusion was reached, primary data, named researchers with credentials, scope and limitations stated, references to prior work, original artifacts (charts, IOC lists, code) downloadable or named, replication path
- 7 — most of those
- 4 — claim + some data, methodology thin
- 0 — opinion piece dressed as research

**Expected signals:** named researchers, methodology, primary data, scope and limitations, references to prior art, downloadable artifacts.

**Top anti-pattern:** unfalsifiable claims ("most secure"). Original research with hedge-walled conclusions reads as marketing.

---

## Personas

Identify the primary persona the page is written for. The persona affects what citation engines expect on the page.

- **SOC analyst / detection engineer** — wants IOCs, ATT&CK references, detection rules, triage paths near the top. Tolerates technical density. Cites: technical detail.
- **CISO / security leader** — wants risk framing, business impact, peer benchmarks, board-ready summary. Cites: framing language and stats.
- **IT ops / sysadmin** — wants patch / config commands, version numbers, rollback procedures. Cites: specific commands.
- **Developer / appsec** — wants code-level detail, CWE references, fix patches in code, framework specifics. Cites: code excerpts.
- **Executive / board** — wants strategic implications, regulatory exposure, peer comparisons, in one page. Cites: executive summary lines.
- **General reader / journalist** — wants the story, named participants, what happened in plain terms. Cites: narrative passages.
- **Compliance officer** — wants regulatory mapping (PCI, HIPAA, SOX, NIS2, DORA, GDPR), audit-ready language, control references. Cites: regulatory mapping.

**The "wrong persona" anti-pattern:** ahackaday.news incident pages are written in a SOC-analyst register but linked from sources where general readers and journalists arrive. A page that serves only one persona is at a disadvantage to a page that includes an executive summary at the top and SOC-grade detail below.

## Output

Add this block to the per-page audit, under the base sub-scores and before the recommended edits:

```
**Segment:** <Detected content type> — confidence: high / medium / low
**Persona:** <Primary persona> (secondary: <if relevant>)
**Segment sub-score:** X/10  (<rubric line from the matching content-type block above>)
```

Then run the signal checklist (`signals.md`) and surface gaps as specific recommendations alongside the generic page-level edits.
