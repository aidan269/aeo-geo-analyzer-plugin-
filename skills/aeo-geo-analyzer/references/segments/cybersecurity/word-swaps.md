# Cybersecurity Word-Level Swaps

Cybersec-specific weak phrasings that hurt citation-worthiness. Apply alongside the generic word-swaps in `../../word-swaps.md`. Same output discipline: quote only phrases actually present on the page, omit categories with zero hits.

---

## 1. Anonymous actors → named or explicitly unattributed

The single most common citation-killer in security writing. AI engines down-weight passages that personify attackers without sourced attribution.

| Weak | Stronger |
|---|---|
| hackers | the named group (e.g., Cl0p, Scattered Spider) — or "an unattributed threat actor as of <date>" |
| cybercriminals | the named criminal cluster — or "a financially-motivated cluster, currently unattributed" |
| nation-state actors | the named cluster (e.g., APT28 / Sandworm / Lazarus) — or "a suspected state-aligned actor, attribution pending" |
| bad actors / bad guys | drop, or use the technical descriptor |
| sophisticated attackers | drop "sophisticated" and either name them or describe the specific TTPs |
| advanced persistent threat | name the APT — generic APT framing has no citation value |
| the hackers responsible | name them or qualify the responsibility claim |

**Apply rule:** anywhere "hackers" appears without a name nearby, add either the name (with source) or an explicit "unattributed as of <date>." Implicit attribution via descriptors is the worst option.

## 2. Generic incident verbs → specific technical verbs

| Weak | Stronger |
|---|---|
| attacked | the specific intrusion method ("exploited the auth-bypass," "phished," "compromised via supply-chain dependency") |
| breached | "accessed", "exfiltrated", "encrypted" — name what happened |
| hacked into | the specific vector |
| compromised | the specific component compromised + how |
| got in via | name the initial-access technique with ATT&CK ID if possible |
| infected | name the malware family and the delivery technique |
| stole data | name the data class + volume if known |
| took control of | name what was controlled and how |

## 3. Vulnerability hand-waving → CVE-anchored language

| Weak | Stronger |
|---|---|
| a vulnerability | CVE-YYYY-NNNNN |
| a critical flaw | CVE-YYYY-NNNNN (CVSS 9.X) |
| a serious bug | name the CWE class and the CVE if assigned |
| a security issue | the CVE or, if pre-CVE, the disclosure ID from the discovering researcher |
| a zero-day | CVE-YYYY-NNNNN (zero-day at disclosure on YYYY-MM-DD) |
| a flaw in X | the CVE in X version range |

## 4. Patching hand-waving → version-anchored language

| Weak | Stronger |
|---|---|
| users should patch | "upgrade to version X.Y.Z (released YYYY-MM-DD)" |
| install the latest update | the specific build number |
| apply the available patch | the patched build + the release date |
| update immediately | name the version and explain priority (KEV / EPSS / observed exploitation) |
| the vendor has released a fix | "<vendor> released build X.Y.Z on <date>, available at <link>" |
| customers should follow vendor guidance | link the guidance + summarize it inline |

## 5. Impact hand-waving → impact-specific language

| Weak | Stronger |
|---|---|
| could compromise systems | name the impact: "allows unauthenticated remote code execution as root" |
| affects security | name the security property affected (confidentiality / integrity / availability) |
| could lead to data exposure | name what data, what access, what attacker capability |
| allows attackers to gain access | specify the access level (unauthenticated / authenticated / privileged) and the attack surface |
| poses a risk | name the risk, name to whom, and quantify if possible |
| has serious implications | name the implications |

## 6. Researcher hand-waving → attributed language

| Weak | Stronger |
|---|---|
| researchers discovered | "<named researchers> at <org>, disclosed YYYY-MM-DD" |
| security researchers | the firm or lab name |
| an independent researcher | the researcher's name and handle |
| analysts say | name the firm |
| threat intelligence firms report | name the firm(s) and their report |
| reports indicate | the specific report + publisher |

## 7. Detection / response hand-waving → telemetry-specific language

| Weak | Stronger |
|---|---|
| monitor for unusual activity | name the telemetry signals (process names, registry keys, network indicators) |
| watch for indicators of compromise | the IOC pack (or link to it) and what to do when matched |
| use EDR to detect | the detection logic (Sigma / KQL / EQL example) |
| implement defense in depth | name the specific layers and what each catches |
| follow security best practices | name the practices with sources (CIS Benchmarks, NIST, vendor hardening guide) |
| harden the environment | name the hardening steps |

## 8. Disclosure hand-waving → timeline-specific language

| Weak | Stronger |
|---|---|
| was recently discovered | the discovery date |
| was disclosed by | "disclosed publicly on YYYY-MM-DD by <named researcher / org>" |
| has been known for some time | the discovery-to-disclosure interval |
| was responsibly disclosed | with the disclosure timeline (reported to vendor → vendor confirmed → patched → disclosed) |
| vendor was notified | when, and with the response timeline |

## 9. Severity hand-waving → score-anchored language

| Weak | Stronger |
|---|---|
| highly critical | CVSS 9.X (vector: ...) — and the assessor (NVD / vendor / independent) |
| extremely severe | the CVSS score plus the impact metrics |
| of the highest severity | the score + the rationale |
| a major security risk | name the CVSS, the KEV status, the EPSS percentile |

## 10. Threat actor framing → MITRE-anchored language

| Weak | Stronger |
|---|---|
| uses sophisticated techniques | the ATT&CK techniques used (with IDs) |
| employs multiple attack vectors | the specific vectors with ATT&CK technique IDs |
| has evolved tactics | name the prior TTPs vs. current TTPs |
| operates globally | the regions and industries observed, with sources |
| is highly capable | name the observed capabilities |

---

## Output format

Emit grouped by category, only categories with hits. Quote exact phrases from the page:

```
### Anonymous actors (3 found)
- "the hackers responsible"  →  the named cluster, with attribution source — or "an unattributed financially-motivated cluster as of 2026-05-04."
- "cybercriminals stole"  →  "the Cl0p cluster exfiltrated, per Microsoft Threat Intelligence's 2026-05-04 report"

### Vulnerability hand-waving (1 found)
- "a critical flaw in MOVEit"  →  "CVE-2026-XXXX in MOVEit Automation versions A.B through C.D (CVSS 9.X, CWE-287)"

### Patching hand-waving (1 found)
- "users should patch immediately"  →  "upgrade to MOVEit Automation build E.F (released 2026-05-04), prioritized given <KEV / EPSS / observed-exploitation status>"
```

Skip categories with zero hits. Do not invent weak phrases.
