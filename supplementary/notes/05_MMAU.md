# [#05] MMAU: A Massive Multi-Task Audio Understanding and Reasoning Benchmark

---

## 0. Bibliographic metadata

- **Title**: MMAU: A Massive Multi-Task Audio Understanding and Reasoning Benchmark
- **Authors**: S Sakshi, Utkarsh Tyagi, Sonal Kumar, Ashish Seth, Ramanswaran Selvakumar, Oriol Nieto, Ramani Duraiswami, Sreyan Ghosh, Dinesh Manocha
- **Year**: 2024
- **Venue**: Pre-print (Under Review) as of submission date (October 2024)
- **arXiv ID**: 2410.19689v1
- **Peer-reviewed?**: under review
- **Project page or code link**: https://sakshi13.github.io/mmau_homepage/
- **Date of latest version read**: 2024-10-24

## 1. Motivation (≤ 5 lines)

Large Language Models have advanced multimodal reasoning, yet current audio-language model evaluation focuses on foundational tasks (ASR, genre classification) rather than expert-level reasoning. A critical gap exists: no comprehensive benchmark assesses advanced audio understanding combining perception, reasoning, and domain-specific knowledge. MMAU fills this gap with 10k expertly-annotated audio QA pairs spanning speech, sound, and music, requiring complex reasoning across 27 distinct skills to evaluate true multimodal audio intelligence.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [x] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [x] **Paralinguistics — style / prosody**
- [x] **Multi-turn dialogue / interaction**
- [ ] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [x] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 10,000 QA pairs |
| Number of tasks | 27 distinct skills across information extraction and reasoning |
| Number of datasets / sub-benchmarks | 13 source datasets pooled (AudioSet, AudioSet Strong, MUsic sarcasm detection, MELD, VoxCeleb-1, IEMOCAP, MusicBench, Jamendo, SDD, MusicCaps, GuitarSet, MUSDB18, Synthetic) |
| Languages covered | English |
| Audio source (real / synthetic / mixed) | Mixed (real and synthetic) |
| Speaker diversity (count, demographics) | NOT STATED |
| Audio length distribution | Average audio length 10.14 sec |
| Open data? | Partial (source datasets vary; final benchmark availability NOT STATED) |

## 4. Evaluation protocol

- **Metric type**: Micro-averaged accuracy (multiple-choice questions with string matching for answer extraction)
- **Scoring details**: Models select one option from 4-5 choices per question. Text-only models receive audio captions (generated via Qwen2-Audio). Robust regex extraction and response-processing workflows developed. Models evaluated with various prompts; best results reported.
- **Models evaluated in the paper**: 18 open-source and proprietary Large Audio-Language Models (LALMs) including Pengi, Audio Flamingo Chat, LTU, LTU-AS, SALAMONN, MusiLingo, MU-LLaMA, M2Gen, GAMA, GAMA-IT, Qwen2-Audio, Qwen2-Audio-Instruct, SALMONN, GPT4o + weak/strong captions, Llama3 8B, Audio Flamingo, and Gemini Pro v1.5, plus human evaluation baseline
- **Reproducibility**: 7-step curation pipeline described; expert annotation guidelines provided; annotation tool shown; domain experts (3 males, 2 females, PhD/industry experience) verified; expert filtering and review stages included; multiple difficulty levels assigned (easy/medium/hard); test-mini and main splits; prompt templates in Appendix

## 5. Reported limitations

- L1: MMAU focuses on multiple-choice tasks and does not evaluate open-ended generation, limiting models' ability to reason freely and exhibit errors like hallucinations.
- L2: Skills for information extraction and reasoning are currently treated as disjoint sets; future work plans to incorporate tasks requiring both skill types.
- L3: Potential biases introduced during human annotation process; authors plan further refinement to minimize any potential biases via additional curation phases.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: holistic (covers three major audio domains: speech, sound, music; combines information extraction + reasoning)
- **Goes into Table 3 row**: MMAU (comprehensive multi-task audio understanding and reasoning)
- **Goes into Figure 3 heatmap cells**: ASR/transcription, Speech QA, Paralinguistics (emotion, prosody), Multi-turn dialogue, Audio environment understanding
- **Tier**: 1 (flagship benchmark; first large-scale comprehensive evaluation of advanced audio reasoning in LALMs)
- **Specific claim it supports**: "Advanced audio-language models lack capabilities at expert-level knowledge and complex reasoning tasks" — MMAU demonstrates significant performance gaps (best model achieves only 52-53%, well below 82% human baseline); most models struggle with perception and reasoning.
- **Gap it surfaces**: Massive gap between expert human performance (82%) and SOTA LALM performance (52-53%); models perform worst on music and speech reasoning; audio perception and complex reasoning remain critical bottlenecks despite recent advances in audio-language modeling.

## 7. Risk / red flags

- **Preprint with unverified claims?** YES — Under review status; main claims include "most advanced models achieve only 52.97% accuracy" and "models fail 47% of the time on music reasoning" — these specific performance numbers should be verified against published versions.
- **Inflated SoTA / cherry-picked baselines?** UNLIKELY — Comprehensive evaluation of 18 models (both open-source and proprietary); includes human baseline for comparison; results appear internally consistent across models and difficulty levels; Gemini Pro v1.5 achieves 52.97% (best open-source Qwen2-Audio at 52.50%), with human evaluation at 82%, suggesting honest reporting.
- **LLM-as-judge reliability issues?** MITIGATED — Expert human annotators (6 total; PhD/industry practitioners) created and filtered QA pairs; annotation guidelines rigorous; separate expert filtering stage; human evaluation on test-mini conducted as ground truth; no reliance on LLM-as-judge for correctness.
- **Coverage bias?** YES — MODERATE — English-only; source datasets reflect existing audio dataset distributions; speaker diversity not documented; may not represent full spectrum of acoustic phenomena or underrepresented speaker populations; synthetic audio included (1394 out of ~10k samples).
- **Reproducibility risk?** LOW-MODERATE — Pipeline well-documented; but benchmark access and final data release status NOT STATED; reproduction would require access to final curated dataset; code and annotation tool may not be publicly available yet (preprint status).

## 8. One-paragraph summary (≤ 120 words, narrative form)

MMAU is the first comprehensive benchmark for evaluating advanced audio understanding and reasoning in large audio-language models, comprising 10,000 carefully curated QA pairs across speech, sound, and music domains. Unlike existing audio benchmarks focused on foundational tasks, MMAU assesses expert-level knowledge retrieval and complex reasoning across 27 distinct skills, requiring models to integrate perception with domain-specific reasoning. Evaluating 18 open-source and proprietary LALMs reveals substantial performance gaps: the best model achieves only 53% accuracy compared to 82% human performance, with models particularly struggling on music tasks and complex reasoning. The benchmark demonstrates that despite recent advances in audio-language modeling, fundamental perceptual and reasoning capabilities remain significant bottlenecks in achieving robust multimodal audio understanding.

---

## Note completion meta

- Completed by: Claude Code
- Completion date: 2026-06-06
- Confidence (1-5): 4
- Outstanding questions: (1) Final benchmark data release status and public availability unclear (preprint only); (2) Speaker demographic composition of final dataset not documented; (3) Exact breakdown of real vs. synthetic data proportions in final 10k samples not specified; (4) Long-term reproducibility depends on code/data release post-review.
