# [#10] VoxEmo: Benchmarking Speech Emotion Recognition with Speech LLMs

---

## 0. Bibliographic metadata

- **Title**: VoxEmo: Benchmarking Speech Emotion Recognition with Speech LLMs
- **Authors**: Hezhao Zhang, Huang-Cheng Chou, Shrikanth Narayanan, Thomas Hain
- **Year**: 2026
- **Venue**: arXiv preprint
- **arXiv ID**: 2603.08936
- **Peer-reviewed?**: no
- **Project page or code link**: NOT STATED
- **Date of latest version read**: March 9, 2026

## 1. Motivation (≤ 5 lines)

Speech LLMs shift SER from closed-set classification to open-ended text generation, introducing zero-shot stochasticity that makes evaluation highly sensitive to prompt design and decoding choices. Existing benchmarks overlook emotion's inherent ambiguity and annotation disagreement. VoxEmo standardizes inference-time protocols and introduces distribution-aware evaluation reflecting real-world perceptual variance across 35 emotion corpora in 15 languages.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [ ] **ASR / transcription**
- [x] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [ ] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [x] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
- [x] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 621,474 utterances (~659 hours) |
| Number of tasks | 1 (speech emotion recognition) |
| Number of datasets / sub-benchmarks | 35 emotion corpora |
| Languages covered | 15 (English, Mandarin, Taiwanese Mandarin, German, Thai, Urdu, Amharic, Italian, Spanish, French, Polish, Persian, Bangla, Greek, Russian) |
| Audio source (real / synthetic / mixed) | Mixed (7 in-the-wild, 28 acted; years 2006-2025) |
| Speaker diversity (count, demographics) | 6,520+ speakers total across datasets; 10-3,711 speakers per corpus |
| Audio length distribution | 0.1-324.1 hours per corpus (median ~7 hours) |
| Open data? | partial (most publicly released; exact availability per corpus documented) |

## 4. Evaluation protocol

- **Metric type**: Hard-label (Weighted Accuracy, Unweighted Accuracy, Macro-F1, Micro-F1); Soft-label (KLD, JSD, TVD, Cosine Similarity, MSE)
- **Scoring details**: Five zero-shot prompt variants (Direct, +T, +A, +T+A, +T+A+R) with greedy decoding; vote-based ensemble aggregating 5 hard-label predictions with uniform fallback for parse failures; supervised fine-tuning with LoRA (r=8, α=16) on LLM decoder attention matrices
- **Models evaluated in the paper**: Qwen2-Audio-7B-Instruct (Q2A), Audio Flamingo 3 (AF3); both use Whisper-large-v3 audio encoder
- **Reproducibility**: Standardized toolkit with explicit prompt templates, output parsing rules, dataset partitioning (speaker-independent splits, leave-one-speaker-out for 4-6 speakers, stratified sampling for small corpora), soft-label ground truth (unsmoothed count-based distributions)

## 5. Reported limitations

- L1: Benchmark evaluates only two ~7B models sharing same audio encoder (Whisper-large-v3); generalization to larger scales or different audio front-ends (especially tokenizer-based architectures) remains open
- L2: Single LoRA configuration used; AF3's limited fine-tuning gains may reflect hyperparameter mismatch rather than fundamental limitation
- L3: Soft-label evaluation restricted to five datasets with per-annotator metadata (CREMA-D, IEMOCAP, MSP-Podcast, BIIC-Podcast, EmotionTalk); aggregate corpus-level metrics only; no within-dataset analysis of class imbalance, per-class performance, or speaker effects

## 6. How this fits into our IPM survey §5

- **Benchmark family**: paralinguistic (emotion recognition via speech LLMs)
- **Goes into Table 3 row**: Speech LLM-based SER benchmark
- **Goes into Figure 3 heatmap cells**: Paralinguistics—emotion [x]; Multilinguality/cross-lingual [x]; Robustness—distribution shift/OOD [x]
- **Tier**: High-tier comprehensive benchmark (35 datasets, 15 languages, novel soft-label protocol)
- **Specific claim it supports**: Zero-shot speech LLMs trail supervised baselines in hard-label accuracy but uniquely align with human subjective emotion distributions; prompt design and corpus construction (acted vs. in-the-wild) systematically shape generative model performance
- **Gap it surfaces**: Generative model stochasticity (prompt sensitivity, parsing failures, inference-time uncertainty) requires unified standardization for reproducible cross-study comparisons; emotion ambiguity and annotation disagreement must be explicitly modeled in benchmarking frameworks

## 7. Risk / red flags

- **Preprint with unverified claims?** Preprint (arXiv); primary contribution is methodological standardization rather than novel model; claims well-supported by extensive experiments across 35 corpora
- **Inflated SoTA / cherry-picked baselines?** No: explicitly compares zero-shot against supervised SOTA (EmoBox reference models) on 30 datasets; zero-shot intentionally underperforms, highlighting different modeling paradigm rather than claiming superiority
- **LLM-as-judge reliability issues?** None directly applicable (no LLM-based evaluation); addresses LLM output parsing reliability with explicit rules and fallback mechanisms; prompt ensemble mitigates formatting failures
- **Coverage bias?** Good coverage: 35 corpora across 15 languages, mix of acted/in-the-wild; minor gaps in underrepresented languages (URDU performance degrades), but acknowledged and discussed
- **Reproducibility risk?** Low: detailed protocol, explicit prompt templates, standardized partitioning, public baseline evaluation on 35 datasets; only concern is AF3 training data overlap with benchmark (IEMOCAP, MELD explicitly included), potentially inflating zero-shot performance

## 8. One-paragraph summary (≤ 120 words, narrative form)

VoxEmo presents a comprehensive benchmark for speech emotion recognition using speech LLMs across 35 datasets in 15 languages. The work addresses a critical gap in how generative models are evaluated for SER, where zero-shot stochasticity (prompt sensitivity, parsing failures, output variance) severely impacts reproducibility. The paper introduces standardized inference protocols, varying prompt complexities from direct classification to reasoning-based approaches, and a novel distribution-aware soft-label evaluation that captures human annotation disagreement. While zero-shot speech LLMs underperform supervised baselines in hard-label accuracy, the benchmark reveals they uniquely align with human subjective emotion distributions. Findings show prompt design and corpus construction (acted vs. naturalistic) systematically shape effectiveness, with Qwen2-Audio-7B outperforming Audio Flamingo 3 on most tasks.

---

## Note completion meta

- Completed by: Claude Code (Haiku 4.5)
- Completion date: 2026-06-06
- Confidence (1-5): 5
- Outstanding questions: None—all template fields completed with information directly from PDF
