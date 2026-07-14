# [#18] SCENEBench: An Audio Understanding Benchmark Grounded in Assistive and Industrial Use Cases

---

## 0. Bibliographic metadata

- **Title**: SCENEBench: An Audio Understanding Benchmark Grounded in Assistive and Industrial Use Cases
- **Authors**: Laya Iyer, Angelina Wang, Sanmi Koyejo
- **Year**: 2026
- **Venue**: arXiv preprint
- **arXiv ID**: 2603.09853v1
- **Peer-reviewed?**: no
- **Project page or code link**: https://github.com/layaiyer/SCENEBench
- **Date of latest version read**: 2026-03-10

## 1. Motivation (≤ 5 lines)

Existing audio benchmarks prioritize controlled, clean-speech scenarios and neglect real-world requirements from accessibility and industrial applications. Large Audio Language Models (LALMs) are evaluated primarily on automatic speech recognition rather than broader audio understanding—tone, emotion, background context, speaker intent. This work identifies systematic failure modes in LALMs across four high-impact use cases where errors have consequential stakes: accessibility tech (hearing impairments, sirens for DHH users), industrial sound monitoring (anomaly detection in factories), multilingual scenarios, and vocal characterization (coughs, sobs).

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [x] **Speech QA / understanding**
- [ ] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [ ] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [x] **Multilinguality / cross-lingual**
- [x] **Latency / streaming evaluation**
- [x] **Robustness — noise / acoustic perturbation**
- [x] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [x] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [x] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 16,000 (synthetic) + 20 (natural validation set) |
| Number of tasks | 4 |
| Number of datasets / sub-benchmarks | 4 task types with sub-datasets |
| Languages covered | Mandarin, Spanish, Hindi, Portuguese, English (code-switched) |
| Audio source (real / synthetic / mixed) | Mixed: synthetic for main benchmark (overlaid ESC-50 with speech); natural recordings from DailyTalk, SEAME, CoSHE-Eval, SDAIA, AudioSet, LibriSpeech |
| Speaker diversity (count, demographics) | NOT STATED for speaker count; natural samples include diverse accents and speaking styles |
| Audio length distribution | Clips from ESC-50 environmental corpus; speech-noise overlays with variable durations |
| Open data? | yes |

## 4. Evaluation protocol

- **Metric type**: Task-specific: (1) Background Sound—FR1 free-response, FR2 targeted follow-up, MC1 4-way multiple choice; (2) Noise Localization—FR1 general description, FR2 direction-specific, MC1 4-way; (3) Cross-Linguistic Transcription—similarity (0–1 via multilingual sentence embeddings); (4) Vocal Characterizers—7-way classification over non-speech vocalizations.
- **Scoring details**: Wilson 95% confidence intervals; Benjamini–Hochberg FDR correction for multiple comparisons; exact prompt wordings in appendices; responses cleaned (lowercasing, punctuation stripping) before matching. Latency measured as median per-clip time (FR1 + FR2 or FR1 + MC1).
- **Models evaluated in the paper**: GPT-4o (OpenAI), Gemini 1.5 (Google), Qwen2-Audio (Alibaba), Audio-Flamingo-3 (NVIDIA), DeSTA2-8B-beta (National Taiwan University + NVIDIA)
- **Reproducibility**: High; data and code released on GitHub; detailed prompts and error taxonomies in appendices; sample size reported (N=6000 per model for main tasks); statistical tests (z-tests, Benjamini–Hochberg) documented

## 5. Reported limitations

- L1: Mixture design uses controlled equal-level overlays rather than natural SNRs; may not reflect real acoustic distributions. Closed-model APIs restrict fine-grained latency profiling and ablation studies. Residual label errors in upstream corpora influence estimates.
- L2: TTS pipeline with back-translation filtering used for cross-lingual speech; does not fully capture natural code-switching spontaneity. Multilingual setup uses synthetic overlays on DailyTalk utterances rather than naturally occurring multilingual speech.
- L3: Small human-validation split (N=20 clips per task) limits ecological validity assessment. Benchmark diagnostic rather than exhaustive; designed to probe high-impact gaps not to replace comprehensive suites. Performance gains on targeted tasks may not generalize to broader real-world deployment.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: task-specific (audio understanding grounded in real-world use cases)
- **Goes into Table 3 row**: Background sound understanding, noise localization, cross-linguistic robustness, vocal characterizer recognition
- **Goes into Figure 3 heatmap cells**: Audio environment/scene understanding; robustness (noise/OOD); multilinguality; code-switching; ASR/transcription; latency
- **Tier**: Tier 2 (specialized multi-task suite addressing underexplored failure modes; not broad holistic evaluation but deep diagnostic coverage of four critical domains)
- **Specific claim it supports**: LALMs excel at transcription but systematically underperform on non-speech audio understanding, motion reasoning, multilingual code-switching, and vocal affect recognition in realistic mixed-source scenarios.
- **Gap it surfaces**: (i) Background sound omission: models prioritize foreground speech transcription, missing environmental context essential for accessibility and safety; (ii) Motion/localization collapse: oscillating patterns and subtle spatial cues underexploit models' capabilities; (iii) Code-switching normalization bias: models normalize away non-English spans despite instructions, reflecting monolingual training dominance; (iv) Paralinguistic underspecification: lexical content overrides non-lexical event categories (laughs misclassified as yawns).

## 7. Risk / red flags

- **Preprint with unverified claims?** Moderate risk. Paper uses arXiv preprint status (not peer-reviewed as of read date). Claims are grounded in large-N experiments (N=6000 clips per model) with rigorous statistical testing and confidence intervals, but lack independent verification.
- **Inflated SoTA / cherry-picked baselines?** Low risk. Benchmark deliberately spans commercial (GPT-4o, Gemini) and open-weight (Qwen2, Audio-Flamingo, DeSTA2) models; no claim of SOTA on this suite (results show gaps). Baselines selected for diversity of architectures and training paradigms.
- **LLM-as-judge reliability issues?** Low-to-moderate risk. FR1/FR2 tasks use free-response scoring via model outputs (not LLM judges), but similarity metrics for cross-lingual transcription rely on multilingual embeddings (not human judges). Human validation split (N=20) is small, limiting assessment of agreement.
- **Coverage bias?** Moderate-to-high risk. Four tasks deliberately chosen to target documented gaps but cover narrow slice of audio understanding; excludes music, fine-grained emotion, speaker verification, music retrieval. Natural validation set is tiny (20 clips) and drawn from limited corpus (AudioSet, ESC-50, LibriSpeech derivatives); ecological validity unvalidated.
- **Reproducibility risk?** Low. Code and data released; prompts detailed in appendices; statistical methods documented; model versions pinned. Closed-model APIs (GPT-4o, Gemini) may drift; open-weight models reproducible.

## 8. One-paragraph summary (≤ 120 words, narrative form)

SCENEBench introduces a targeted four-task benchmark designed to expose failure modes in Large Audio Language Models beyond transcription accuracy. Grounded in accessibility and industrial-safety use cases, it evaluates background sound understanding (identifying environmental audio mixed with speech), noise localization (detecting motion patterns), cross-linguistic robustness (transcribing code-switched utterances), and vocal characterization (classifying non-speech vocalizations like coughs and sobs). Across five state-of-the-art models, systematic gaps emerge: models omit background events, collapse oscillating patterns, normalize away non-English spans despite instructions, and misclassify paralinguistic cues. By pairing synthetic stimuli (16k clips) with natural validation samples (20 clips), the work balances reproducibility with ecological grounding. Results indicate LALMs are optimized for foreground-speech transcription rather than holistic audio scene understanding.

---

## Note completion meta

- Completed by: Claude Haiku 4.5
- Completion date: 2026-06-06
- Confidence (1-5): 4
- Outstanding questions: (i) Exact speaker count and demographic breakdown for natural validation set not provided—limits assessment of speaker diversity. (ii) Human inter-annotator agreement (IAA) on the 20 natural-sample validation set not reported; single-annotator validation limits gold-standard reliability. (iii) No details on whether models saw SCENEBench data during pre-training (contamination risk unlikely given 2026 preprint date, but not explicitly ruled out).
