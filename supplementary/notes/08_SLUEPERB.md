# [#08] SLUE Phase-2: A Benchmark Suite of Diverse Spoken Language Understanding Tasks

---

## 0. Bibliographic metadata

- **Title**: SLUE Phase-2: A Benchmark Suite of Diverse Spoken Language Understanding Tasks
- **Authors**: Suwon Shon, Siddhant Arora, Chyi-Jiunn Lin, Ankita Pasad, Felix Wu, Roshan Sharma, Wei-Lun Wu, Hung-Yi Lee, Karen Livescu, Shinji Watanabe
- **Year**: 2023
- **Venue**: INTERSPEECH 2023
- **arXiv ID**: 2212.10525v2
- **Peer-reviewed?**: yes
- **Project page or code link**: To be released (mentioned in paper)
- **Date of latest version read**: June 2026

## 1. Motivation (≤ 5 lines)

SLUE Phase-2 extends the original SLUE benchmark by introducing four new spoken language understanding tasks (Dialog Act Classification, Question Answering, Speech Summarization, Named Entity Localization) beyond the two original tasks. Motivation: existing benchmarks focus on lower-level tasks (ASR, speaker identification) rather than higher-level understanding. The benchmark uses only conversational or longer discourse speech with freely available data and high-quality human annotations, supporting both pipeline and end-to-end model evaluation.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [ ] **ASR / transcription**
- [x] **Speech QA / understanding**
- [ ] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [ ] **Paralinguistics — style / prosody**
- [x] **Multi-turn dialogue / interaction**
- [ ] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
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
| Total samples | 22,236 utterances across all tasks |
| Number of tasks | 4 tasks (DAC, QA, SUMM, NEL) |
| Number of datasets / sub-benchmarks | 4 main datasets (SLUE-HVB, SLUE-SQA-5, SLUE-TED, SLUE-VoxPopuli) |
| Languages covered | English |
| Audio source (real / synthetic / mixed) | Real (conversational banking dialogs, Wikipedia documents, TED talks) |
| Speaker diversity (count, demographics) | 400+ different speakers (approximately); demographics not stated |
| Audio length distribution | Highly variable: dialog turns (seconds to minutes), full documents (up to hours of discourse); TED talks average 705 seconds; summarization transcripts average 1757 words |
| Open data? | partial (Creative Commons licensed, freely available data; to be released upon publication) |

## 4. Evaluation protocol

- **Metric type**: Task-specific metrics: DAC (macro-averaged F1 using frame-F1), QA (frame-level F1 for answer span), SUMM (ROUGE-L, ROUGE-2, METEOR, BERTScore), NEL (frame-F1 and word-F1 with hyperparameter ρ)
- **Scoring details**: WER sensitivity analysis shows strong correlation with task performance; pipeline models (ASR+text model) compared against E2E models; baseline evaluation uses both oracle transcripts and ASR outputs
- **Models evaluated in the paper**: Pipeline baselines: off-the-shelf ASR models (Whisper, wav2vec2, NeMo), text models (DeBERTa, Longformer); E2E baselines: DUAL (wav2vec2-large + Longformer), ESPNet-based models; multiple NeMo model variants tested
- **Reproducibility**: Detailed hyperparameter tuning reported (Appendix), multiple random seeds, detailed model training configurations, scheduled release of code and data

## 5. Reported limitations

- L1: Lack of human performance evaluation—baseline performance is far from perfect, making it unclear how much room for improvement exists or if human performance would be much better
- L2: Unknown how much each task should benefit from audio access in addition to text; this is a design question left for future work
- L3: Focus on English only; no multilingual coverage despite speech being critical for underserved, unwritten languages

## 6. How this fits into our IPM survey §5

- **Benchmark family**: holistic (multiple diverse SLU tasks in one suite)
- **Goes into Table 3 row**: SLUE Phase-2 (2023 successor to SLUE Phase-1)
- **Goes into Figure 3 heatmap cells**: Speech QA/understanding [x], Multi-turn dialogue/interaction [x]
- **Tier**: Tier 1 (major published benchmark with multiple tasks and datasets)
- **Specific claim it supports**: Demonstrates that pipeline models (ASR+NLP) remain competitive with E2E models on several SLU tasks; highlights WER sensitivity across different task types; supports claim that SLU requires attention beyond lower-level tasks
- **Gap it surfaces**: End-to-end models have not yet achieved consistent advantage over pipelines; models struggle with semantic understanding requiring long-context integration; annotation biases exist in automatic speech-to-text service filtering

## 7. Risk / red flags

- **Preprint with unverified claims?** No—published at INTERSPEECH 2023 (peer-reviewed venue). Claims are supported by extensive baselines.
- **Inflated SoTA / cherry-picked baselines?** Low risk—multiple baseline families tested (Whisper, wav2vec2, NeMo variants), reproducible experimental setup with reported hyperparameters. No single dominant model emerges.
- **LLM-as-judge reliability issues?** No LLM-based evaluation. Task evaluation uses standard NLP metrics (F1, ROUGE, BERTScore) with human-annotated reference data. One potential concern: 30% WER threshold for filtering QA data may introduce bias if correlated with speaker demographics.
- **Coverage bias?** Moderate risk—English-only data; Harper Valley Bank (HVB) is domain-specific (banking); TED talks are biased toward educated speakers and certain topics. No discussion of demographic representation.
- **Reproducibility risk?** Low—detailed hyperparameter appendices, multiple model architectures tested with consistent random seeds, code/data scheduled for release.

## 8. One-paragraph summary (≤ 120 words, narrative form)

SLUE Phase-2 introduces four diverse spoken language understanding tasks (Dialog Act Classification, Question Answering, Speech Summarization, Named Entity Localization) evaluated on real conversational and discourse speech from banking dialogs, Wikipedia documents, and TED talks. The benchmark includes comprehensive baselines comparing pipeline approaches (ASR plus text models) against end-to-end systems using wav2vec2, Whisper, and Longformer. Results show strong WER sensitivity across tasks and demonstrate that pipeline and E2E models have complementary strengths. The authors analyze task-specific challenges—e.g., summarization struggles with entity extraction, QA performance improves with stronger ASR—and provide detailed error analyses and hyperparameter tuning protocols to support reproducible future research.

---

## Note completion meta

- Completed by: Claude Code Agent
- Completion date: 2026-06-06
- Confidence (1-5): 5
- Outstanding questions: None—all template fields completed with information directly from paper or marked NOT STATED where unavailable.
