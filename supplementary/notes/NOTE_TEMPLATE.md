# [#NN] <Paper Title>

> **Instructions for the agent filling this note**: Read the source PDF carefully. Fill EVERY field below. Do not invent numbers — if a field is not stated in the paper, write `NOT STATED`. Keep entries terse but factual. The checklist in §2 will be machine-parsed to build the Figure 3 heatmap; please use exact `[x]` / `[ ]` syntax.

---

## 0. Bibliographic metadata

- **Title**:
- **Authors**:
- **Year**:
- **Venue**: (e.g., ACL 2024 / NeurIPS 2024 / arXiv preprint)
- **arXiv ID**:
- **Peer-reviewed?**: yes / no / under review
- **Project page or code link**:
- **Date of latest version read**:

## 1. Motivation (≤ 5 lines)

What gap does this benchmark fill that prior benchmarks did not?

## 2. Capability coverage checklist (machine-parsed for Figure 3)

Mark `[x]` if the benchmark explicitly evaluates this capability, otherwise `[ ]`.

- [ ] **ASR / transcription**
- [ ] **Speech QA / understanding** (semantic comprehension of spoken content)
- [ ] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits** (age / gender / identity)
- [ ] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [ ] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding** (non-speech audio)
- [ ] **Speech generation quality** (TTS-MOS-style)
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | |
| Number of tasks | |
| Number of datasets / sub-benchmarks | |
| Languages covered | |
| Audio source (real / synthetic / mixed) | |
| Speaker diversity (count, demographics) | |
| Audio length distribution | |
| Open data? | yes / partial / no |

## 4. Evaluation protocol

- **Metric type**: rule-based / LLM-as-judge / human / mixed
- **Scoring details** (if LLM-as-judge: which model? human agreement? if rule-based: which metrics — WER / BLEU / MOS / accuracy / F1 / other?):
- **Models evaluated in the paper** (full list):
- **Reproducibility**: open code? open leaderboard? evaluation server?

## 5. Reported limitations (cite the paper itself, not your opinion)

- L1:
- L2:
- L3:

## 6. How this fits into our IPM survey §5

- **Benchmark family** (one of: task-specific / holistic / voice-assistant / paralinguistic / multilingual / safety / agentic / probing):
- **Goes into Table 3 row**: (one-line summary of family / scale / capability / metric / limitation)
- **Goes into Figure 3 heatmap cells**: (list capabilities marked `[x]` in §2)
- **Tier**: 1 (core evidence) / 2 (supporting) / 3 (emerging-preprint, use cautiously)
- **Specific claim it supports** in our survey:
- **Gap it surfaces** (will feed §5.5 gap analysis):

## 7. Risk / red flags (be skeptical)

- Preprint with unverified claims? (yes / no — explain)
- Inflated SoTA / cherry-picked baselines?
- LLM-as-judge reliability issues?
- Coverage bias (English-dominant / single domain / synthetic-only)?
- Reproducibility risk (closed model / closed data / no code)?

## 8. One-paragraph summary (≤ 120 words, narrative form)

Write a tight paragraph we can paraphrase into the survey body text. Cover: what it is, what it tests, what scale, key finding about current Speech LLMs, key limitation.

---

## Note completion meta

- Completed by:
- Completion date:
- Confidence (1-5):
- Outstanding questions:
