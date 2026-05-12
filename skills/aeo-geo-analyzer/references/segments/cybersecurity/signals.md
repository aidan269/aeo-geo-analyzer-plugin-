# Cybersecurity Signal Checklist

Domain-specific facts that AI search engines look for when surfacing cybersec content. Each signal has a regex or pattern for detection, a citation-weight, and a fix recommendation when absent.

Run this checklist for each page after identifying the content type. Mark each expected signal as **present / partial / absent**. Missing high-weight signals become specific recommendations in the audit output.

**"Expected for"** = the content types from `content-types.md` where this signal materially affects citation-worthiness. A signal not expected for a type is not penalized when missing.

---

## A. Identifier signals

### A1. CVE ID
- **Pattern:** `CVE-\d{4}-\d{4,7}`
- **Weight:** very high
- **Expected for:** CVE explainer, incident report (if vuln-driven), advisory rollup, runbook
- **Fix when absent:** name the CVE explicitly in the first 100 words. If the incident has no CVE yet, state "no CVE assigned as of <date>" rather than leaving the question open.

### A2. CVSS score + vector
- **Pattern:** `CVSS:3.\d/AV:.../...` or just a score with version (`CVSS 9.8 (v3.1)`)
- **Weight:** very high
- **Expected for:** CVE explainer, advisory rollup, incident report (vuln-driven)
- **Fix when absent:** include both the score and the vector string. The vector tells security readers more than the score alone.

### A3. CWE classification
- **Pattern:** `CWE-\d{2,4}`
- **Weight:** medium
- **Expected for:** CVE explainer, vendor advisory, technique writeup
- **Fix when absent:** map the vulnerability class. "Authentication bypass" → CWE-287 / CWE-290 / CWE-306 as appropriate.

### A4. MITRE ATT&CK technique
- **Pattern:** `T\d{4}(\.\d{3})?` or `Technique T\d{4}`
- **Weight:** high
- **Expected for:** TTP writeup, runbook, defensive guide, threat-actor profile, post-mortem
- **Fix when absent:** map the observed behavior to ATT&CK technique IDs with the technique name. "Credential dumping (T1003)" is far more citable than "credential theft."

### A5. MITRE ATT&CK group ID
- **Pattern:** `G\d{4}`
- **Weight:** medium
- **Expected for:** threat-actor profile
- **Fix when absent:** reference the canonical group ID from MITRE so the page links into the ATT&CK ecosystem.

---

## B. Exploitation / context signals

### B1. CISA KEV catalog status
- **Pattern:** "KEV" or "Known Exploited Vulnerabilities" or explicit catalog reference
- **Weight:** very high
- **Expected for:** CVE explainer, incident report, advisory rollup
- **Fix when absent:** state KEV status explicitly. "Added to CISA KEV on YYYY-MM-DD" or "Not currently in CISA KEV as of YYYY-MM-DD." Either is citable; ambiguity is not.

### B2. EPSS score
- **Pattern:** "EPSS" + a probability or percentile
- **Weight:** medium
- **Expected for:** CVE explainer, advisory rollup
- **Fix when absent:** name the EPSS score and percentile when discussing exploitability likelihood.

### B3. Exploitation-in-wild status
- **Pattern:** explicit yes/no with attribution
- **Weight:** very high
- **Expected for:** CVE explainer, incident report
- **Fix when absent:** state it. "Actively exploited in the wild as of <date>, per <source>" or "no public reports of exploitation as of <date>." Hedged phrasing here is a citation killer.

### B4. Public exploit / PoC availability
- **Pattern:** "PoC" / "proof-of-concept" / "Metasploit module" / GitHub link to exploit
- **Weight:** medium
- **Expected for:** CVE explainer, technique writeup
- **Fix when absent:** if known, state it explicitly with the source.

---

## C. Scope / impact signals

### C1. Affected vendor + product + version range
- **Pattern:** vendor name + product + "versions A.B through C.D" or explicit version list
- **Weight:** very high
- **Expected for:** CVE explainer, incident report (vuln-driven), advisory
- **Fix when absent:** list affected versions explicitly. "All versions prior to X.Y.Z" is acceptable; vague "older versions" is not.

### C2. Patched version
- **Pattern:** "patched in", "fixed in", explicit version
- **Weight:** very high
- **Expected for:** CVE explainer, advisory, incident report (vuln-driven)
- **Fix when absent:** name the patched build number(s) and release date. "Patched in X.Y.Z, released YYYY-MM-DD."

### C3. Workaround / mitigation when no patch
- **Pattern:** "workaround" / "mitigation" + specific instruction
- **Weight:** high
- **Expected for:** CVE explainer when no patch is available, defensive guide
- **Fix when absent:** specify the workaround at the config / network / process level, not just the abstract goal.

### C4. Breach scope
- **Pattern:** numbers (records, accounts, repos, customers) + scope statement
- **Weight:** high
- **Expected for:** incident report
- **Fix when absent:** quantify the impact. "A portion of source code" or "an undisclosed number of records" without further specifics is a low-citation phrase.

---

## D. Attribution signals

### D1. Named threat actor / group
- **Pattern:** named group with attribution source
- **Weight:** high
- **Expected for:** incident report (where attribution exists), threat-actor profile, TTP writeup
- **Fix when absent:** if a named actor is publicly suspected, name them with attribution source. If unattributed, state "no attribution as of <date>." Implicit attribution ("sophisticated actor") is the worst option.

### D2. Malware family name
- **Pattern:** named malware (Cobalt Strike, LockBit, etc.)
- **Weight:** medium
- **Expected for:** incident report (when malware was used), TTP writeup
- **Fix when absent:** name the family and version.

### D3. Attribution confidence
- **Pattern:** "high confidence" / "moderate confidence" / qualified attribution language
- **Weight:** medium
- **Expected for:** threat-actor profile, incident report when attributing
- **Fix when absent:** include the confidence level when naming actors. Attribution without confidence framing is a citation risk.

---

## E. Timeline signals

### E1. Disclosure timeline
- **Pattern:** dates for: discovered, reported, vendor-acknowledged, patched, publicly disclosed
- **Weight:** high
- **Expected for:** CVE explainer, incident report, post-mortem
- **Fix when absent:** include the timeline. Even a partial timeline (just discovery + disclosure) materially helps.

### E2. Publish + last-updated dates
- **Pattern:** visible `Published:` and `Updated:` at the top of the page
- **Weight:** very high (covered by base rubric Freshness sub-score)
- **Expected for:** all types
- **Fix when absent:** add both. For news / incidents, this is non-negotiable.

---

## F. Reference signals

### F1. Authoritative source link
- **Pattern:** link to CISA, MITRE, NVD, vendor advisory, FIRST, NCSC, NIST publication
- **Weight:** high
- **Expected for:** all types, weighted higher for CVE explainer and advisory rollup
- **Fix when absent:** add at least one link to a primary source. The vendor advisory is usually the strongest single citation for vuln content.

### F2. Researcher / lab credit
- **Pattern:** named researcher + affiliation
- **Weight:** medium
- **Expected for:** CVE explainer (credit the discoverer), TTP writeup, research piece
- **Fix when absent:** credit the discovering researcher with their affiliation. Both for E-E-A-T and as a basic norm.

### F3. Detection rule reference
- **Pattern:** Sigma YAML, YARA rule, KQL, SPL, EQL code blocks; or links to detection-rule repos
- **Weight:** high
- **Expected for:** runbook, TTP writeup, technique writeup
- **Fix when absent:** include at least one detection rule example, or link to an authoritative one.

### F4. IOC pack
- **Pattern:** hashes, IPs, domains, paths, with normalization
- **Weight:** very high
- **Expected for:** incident report (when applicable), runbook, threat-actor profile
- **Fix when absent:** if IOCs are publicly available, include them. Group by type (hashes / IPs / domains / paths). Use a copy-friendly format.

---

## Output format

Emit a checklist block per audited page, only listing signals **expected** for the detected content type. Mark each present (✓), partial (~), absent (✗). Absent signals appear in the recommendations.

```
### Signal coverage (content type: <type>)

Identifiers
- A1 CVE ID:                   ✓ CVE-2026-XXXXX
- A2 CVSS score + vector:      ~ score present, vector missing
- A4 MITRE ATT&CK technique:   ✗

Exploitation context
- B1 CISA KEV status:          ✗
- B3 Exploitation-in-wild:     ~ hedged ("may have been exploited")

Scope
- C1 Affected versions:        ✓ A.B through C.D
- C2 Patched version:          ✓ E.F released YYYY-MM-DD

Timeline
- E1 Disclosure timeline:      ✗
- E2 Visible publish + updated dates: ✓ / ✗

References
- F1 Authoritative source link: ~ links to vendor advisory only

Signal gaps to fill: A2 (vector), A4 (ATT&CK), B1 (KEV), B3 (firm up exploitation status), E1 (timeline)
```

Convert the "signal gaps" line into specific recommendations in the page-level edits section. Each gap becomes a one-sentence recommendation with the exact text to add.
