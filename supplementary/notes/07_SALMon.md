# [#07] SALMON: A Suite for Acoustic Language Model Evaluation

---

## 0. Bibliographic metadata

- **Title**: SALMON: A Suite for Acoustic Language Model Evaluation
- **Authors**: Gallil Maimon, Amit Roth, Yossi Adi (Hebrew University of Jerusalem)
- **Year**: 2024
- **Venue**: Preprint (arXiv:2409.07437v3)
- **arXiv ID**: 2409.07437
- **Peer-reviewed?**: no
- **Project page or code link**: pages.cs.huji.ac.il/adiyoss-lab/salmon/
- **Date of latest version read**: 2025-01-15

## 1. Motivation (≤ 5 lines)

Speech language models (SLMs) demonstrate strong semantic performance but lack evaluation of acoustic aspects beyond spoken content. Existing acoustic evaluation is limited to isolated aspects (emotion, prosody) or requires compute-intensive generation-based approaches. SALMON addresses this gap by proposing a fast, modelling-based evaluation suite spanning background noise, sentiment, speaker identity, and room impulse response. It measures both acoustic consistency (within-sample stability) and acoustic-semantic alignment (alignment between acoustic cues and text meaning).

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [ ] **ASR / transcription**
- [ ] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [x] **Paralinguistics — speaker traits**
- [x] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [ ] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [x] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | NOT STATED |
| Number of tasks | 8 (6 consistency + 2 alignment) |
| Number of datasets / sub-benchmarks | 8 task variants |
| Languages covered | English only (implied from datasets used) |
| Audio source (real / synthetic / mixed) | Mixed (real recordings for consistency; synthetic TTS for alignment) |
| Speaker diversity (count, demographics) | 105 speakers (VCTK), 4 speakers (Expresso), 1 speaker (LJ Speech); gender annotations |
| Audio length distribution | 4.39–7.69 seconds (varies by task; mean ± std in Table I) |
| Open data? | yes |

## 4. Evaluation protocol

- **Metric type**: Modelling-based pairwise preference. For each task, model assigns likelihood to positive vs. negative samples; score = fraction where M(positive) > M(negative).
- **Scoring details**: Likelihood computed as mean of log probabilities over tokens: M([w1,...,wt]) = (1/t) Σ p(wi|wi-1,...,w1). On tied scores, assigns 0.5 points to emulate random baseline = 50%.
- **Models evaluated in the paper**: TWIST (350M, 1.3B, 7B), LAST (350M, 1.3B), pGSLM, Spirit-LM (base + expressive), ASR+LLM baseline, human raters.
- **Reproducibility**: Evaluation script and full benchmarks publicly released. Task construction fully described. Human evaluation conducted (20 samples per task, 3+ annotators per sample).

## 5. Reported limitations

- L1: Human evaluation filtering is "inherently limited and subjective," especially for sentiment alignment where TTS quality gaps between cheerful/sad/emphatic/touched are ambiguous.
- L2: Training data for evaluated SLMs derived from audiobooks and podcasts (studio-quality audio without background noise or reverberation), limiting exposure to acoustic variations tested.
- L3: Models use discrete acoustic tokens (HuBERT) or pitch trackers designed for speech, potentially ill-suited for modelling background noise or non-speech acoustic phenomena.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: paralinguistic (emotion, speaker identity, acoustic properties)
- **Goes into Table 3 row**: Acoustic modelling / speech language models
- **Goes into Figure 3 heatmap cells**: Paralinguistics (emotion, speaker traits, style/prosody); Robustness (noise/acoustic perturbation)
- **Tier**: Tier 2 (focused benchmark; modelling-based, well-motivated but limited to 4 acoustic aspects; no multilinguality or cross-lingual evaluation)
- **Specific claim it supports**: Speech language models struggle with acoustic modelling beyond semantic content; joint acoustic-semantic reasoning remains an open challenge.
- **Gap it surfaces**: Large gap between human performance (83–98%) and SLM performance (40–73% on consistency; 48–61% on alignment) shows acoustic awareness is severely underdeveloped in current SLMs.

## 7. Risk / red flags

- Preprint with unverified claims? Yes — arXiv preprint; no peer review indicated. Claims about human performance and baseline comparisons not independently verified.
- Inflated SoTA / cherry-picked baselines? No — fair comparison; includes multiple model families (TWIST, pGSLM, Spirit-LM, LAST) with different architectural choices. Includes weaker baseline (ASR+LLM).
- LLM-as-judge reliability issues? Partial — uses GPT-4 for synthetic text generation but acknowledges subjective manual filtering of alignment samples. Human evaluation validates labels but limited scale (20 samples/task).
- Coverage bias? Yes — English only; audiobook/podcast-derived training data; synthetic audio for alignment tasks. Limited to 4 acoustic dimensions (sentiment, speaker, background, RIR). Sentiment alignments rely on Azure TTS quality, which authors acknowledge as limited.
- Reproducibility risk? Low — code, data, and evaluation scripts publicly released; detailed task construction. Reproducibility bounded by TTS quality variations and human annotation subjectivity.

## 8. One-paragraph summary (≤ 120 words, narrative form)

SALMON is a modelling-based evaluation suite for acoustic language models spanning background noise consistency, sentiment, speaker identity, gender, and room impulse response. It comprises two task types: acoustic consistency (whether models assign higher likelihood to natural recordings vs. those with mid-sample acoustic switches) and acoustic-semantic alignment (whether acoustic cues match spoken content). Evaluated on TWIST, pGSLM, Spirit-LM, and LAST, SALMON reveals substantial gaps between human performance (83–98%) and model performance (40–73%), demonstrating that contemporary SLMs struggle with acoustic phenomena despite semantic strength. The benchmark is fast to compute, requires no external models or vocoders, and includes public code and data.

---

## Note completion meta

- Completed by: Claude Haiku 4.5
- Completion date: 2026-06-06
- Confidence (1-5): 5
- Outstanding questions: None — all template fields completed. Paper clearly structured and information consistently available.
