# [#02] VoiceBench: Benchmarking LLM-Based Voice Assistants

---

## 0. Bibliographic metadata

- **Title**: VoiceBench: Benchmarking LLM-Based Voice Assistants
- **Authors**: Yiming Chen, Xianghu Yue, Chen Zhang, Xiaoxue Gao, Robby T. Tan, Haizhou Li
- **Year**: 2024
- **Venue**: arXiv preprint (December 2024)
- **arXiv ID**: 2411.19663
- **Peer-reviewed?**: no
- **Project page or code link**: https://github.com/MatthewCYM/VoiceBench
- **Date of latest version read**: 2024-12-11

## 1. Motivation (≤ 5 lines)

VoiceBench addresses the gap in comprehensive evaluation frameworks for LLM-based voice assistants. While prior work focuses narrowly on ASR or text-based QA, VoiceBench fills three key gaps: (1) lack of standardized benchmarks tailored to voice assistants beyond ASR, (2) insufficient evaluation of instruction-following and safety capabilities in speech-based interactions, and (3) absence of systematic assessment of robustness across real-world speaker variations, environmental conditions, and content-related errors. Current evaluations fail to capture the full spectrum of voice assistant capabilities and vulnerabilities.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [x] **Speech QA / understanding**
- [ ] **Paralinguistics — emotion**
- [x] **Paralinguistics — accent / dialect**
- [x] **Paralinguistics — speaker traits**
- [ ] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [ ] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [x] **Robustness — noise / acoustic perturbation**
- [x] **Robustness — distribution shift / OOD**
- [x] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 3,074 (AlpacaEval subset: 636; CommonEval: 200; SD-QA: 553; OpenBookQA: 455; MMSU: 3,074; IfEval: 345; AdvBench: 520) |
| Number of tasks | 8 |
| Number of datasets / sub-benchmarks | 8 (AlpacaEval, AlpacaEval', CommonEval, SD-QA, OpenBookQA, MMSU, IfEval, AdvBench) |
| Languages covered | English (primary); accent variation: 11 accents from Australia, UK, North/South India, Ireland, Kenya, Nigeria, New Zealand, Philippines, United States, South Africa |
| Audio source (real / synthetic / mixed) | Mixed: real spoken instructions (CommonEval, SD-QA) + synthetic speech via TTS (Google TTS, MeloTTS) |
| Speaker diversity (count, demographics) | Ages 20-80 (from DynamicSUPERB); male and female speakers per accent group; child speech included (online collection) |
| Audio length distribution | 30 seconds maximum (capped) |
| Open data? | partial |

## 4. Evaluation protocol

- **Metric type**: Multi-metric approach: (1) GPT-4 scoring (1-5 scale) for open-ended QA (AlpacaEval, CommonEval); (2) exact match accuracy for SD-QA and reference-based QA; (3) rule-based multiple-choice extraction for multiple-choice QA; (4) refusal rate for safety (AdvBench)
- **Scoring details**: For AlpacaEval/CommonEval, GPT-4 assigns scores 1-5 based on relevance, accuracy, and completeness. For SD-QA, accuracy calculated against human-labeled references. For MMSU, rule-based extraction of multiple-choice options. Safety measured by refusal rate (predefined refusal phrases detected via GPT-4).
- **Models evaluated in the paper**: Naive, Naive-4o, DiVA, LLaMA-Omni, Mini-Omni, Mini-Omni2, Qwen2-Audio, VITA, Moshi, GPT-4o-Audio
- **Reproducibility**: Code and data available at GitHub; generation prompts and evaluation prompts documented in appendices; TTS models specified (Google TTS, MeloTTS); capped audio length (30s) to ensure compatibility

## 5. Reported limitations

- L1: Over-reliance on synthetic data for robustness evaluation due to high cost of generating real multilingual instruction data. While synthetic and real data show strong correlation, synthetic data may not fully capture nuanced acoustic characteristics of real speech.
- L2: Limited language coverage. Benchmark primarily focuses on English with accent variations; does not provide comprehensive multilingual evaluation across distinct languages, limiting generalizability to non-English voice assistants.
- L3: Narrow scope of content variations. While paper addresses eight types of speech content errors (clean, repair, repeat, pause, interjektion, false start, mispronunciation, grammar error), it does not exhaustively cover all real-world speech phenomena or spontaneous conversational patterns.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: voice-assistant
- **Goes into Table 3 row**: Table 3: Speech-Based LLM Assistants (new row with VoiceBench details)
- **Goes into Figure 3 heatmap cells**: Columns for ASR, Speech QA, Accent/Dialect, Speaker Traits, Robustness (Noise, Distribution Shift), Safety; rows for each of the 10 voice assistants evaluated
- **Tier**: Tier 1 (comprehensive, published, widely adopted evaluation framework for voice assistants)
- **Specific claim it supports**: "End-to-end voice assistants significantly lag behind pipeline models on instruction-following tasks, revealing a major evaluation gap beyond ASR metrics"
- **Gap it surfaces**: (1) Text-speech processing gap (4.37 points between text and speech instructions for Naive model), (2) Weak robustness to speaker variations (especially VITA under accent shift), (3) Safety vulnerabilities in voice mode (some models reject malicious instructions in text but accept in speech)

## 7. Risk / red flags

- **Preprint with unverified claims?** Partially. Preprint (arXiv Dec 2024, not peer-reviewed), but authors from National University of Singapore and evaluation is comprehensive. Code/data availability claimed. Risk: modest (preliminary work, but rigorous).
- **Inflated SoTA / cherry-picked baselines?** Low risk. Paper evaluates diverse models (both open-source and proprietary) across fair metrics. No obvious cherry-picking observed; includes weak baselines (Mini-Omni) to show gaps honestly.
- **LLM-as-judge reliability issues?** Moderate risk. GPT-4 used for scoring open-ended responses (1-5 scale). Paper validates correlation with human judgments and PANDA (pedagogical) labels, but single-judge setup without inter-annotator agreement reported. Appendix B shows evaluation prompts but limited discussion of prompt sensitivity.
- **Coverage bias?** Moderate risk. Synthetic speech may not fully capture real-world acoustic diversity; real data limited to 11 accents (primarily Global South + UK/US/AUS). Missing tonal languages, code-switching, and rich multilingual scenarios. Accent data generated via TTS (Google, MeloTTS), not recorded.
- **Reproducibility risk?** Low risk. Code and data promised to be available. TTS models and parameters specified. Evaluation prompts provided in appendices. 30-second audio cap enforced consistently. Main uncertainty: whether all synthetic data generation code will be released.

## 8. One-paragraph summary (≤ 120 words, narrative form)

VoiceBench introduces the first comprehensive benchmark for evaluating LLM-based voice assistants beyond ASR metrics, assessing general knowledge, instruction-following, and safety capabilities on both synthetic and real spoken instructions. Evaluating eight voice assistants (Naive, DiVA, LLaMA-Omni, Mini-Omni, Qwen2-Audio, VITA, Moshi, GPT-4o-Audio), the benchmark reveals critical gaps: end-to-end voice assistants significantly underperform text-based counterparts on instruction tasks (4.37-point gap for Naive), demonstrate vulnerability to speaker variations (accent, age, speed, pitch), and face robustness challenges under environmental noise and speech distortions. Safety evaluation uncovers that some assistants accept malicious instructions in speech mode despite rejecting them textually, emphasizing the need for dedicated voice-centric evaluation protocols.

---

## Note completion meta

- Completed by: Claude Code
- Completion date: 2026-06-06
- Confidence (1-5): 5
- Outstanding questions: None. All template fields completed from paper content.
