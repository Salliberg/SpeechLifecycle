# [#03] Dynamic-SUPERB Phase-2: A Collaboratively Expanding Benchmark for Measuring the Capabilities of Spoken Language Models with 180 Tasks

---

## 0. Bibliographic metadata

- **Title**: Dynamic-SUPERB Phase-2: A Collaboratively Expanding Benchmark for Measuring the Capabilities of Spoken Language Models with 180 Tasks
- **Authors**: Chien-yu Huang, Wei-Chih Chen, Shu-wen Yang, Andy T. Liu, Chen-An Li, and 50+ contributors
- **Year**: 2025
- **Venue**: ICLR 2025 (Published as a conference paper)
- **arXiv ID**: NOT STATED
- **Peer-reviewed?**: yes
- **Project page or code link**: https://github.com/dynamic-superb/dynamic-superb
- **Date of latest version read**: 2026-06-06

## 1. Motivation (≤ 5 lines)

Multimodal foundation models (e.g., Gemini, ChatGPT) have revolutionized human-machine interaction by integrating speech and text. Despite significant research in universal spoken language models, comprehensive evaluation benchmarks remain scarce. Existing speech benchmarks (SUPERB, SLUE, HEAR, MARBLE, AIR-Bench) are limited to classification tasks or specific aspects of speech. Dynamic-SUPERB Phase-2 addresses this critical gap by offering 180 diverse tasks spanning speech, music, and audio to comprehensively evaluate universal instruction-based models across broader capabilities and real-world scenarios.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [x] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [x] **Paralinguistics — accent / dialect**
- [x] **Paralinguistics — speaker traits**
- [x] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [x] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [x] **Robustness — noise / acoustic perturbation**
- [x] **Robustness — distribution shift / OOD**
- [x] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [x] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [x] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | NOT STATED (180 tasks with varying sample sizes per task) |
| Number of tasks | 180 |
| Number of datasets / sub-benchmarks | 80+ individual datasets integrated |
| Languages covered | Multiple (8 multilingual ASR variants; accent classification; code-switching tasks) |
| Audio source (real / synthetic / mixed) | Mixed (real speech, music, audio; some synthetic data) |
| Speaker diversity (count, demographics) | NOT STATED (diverse sources across speech, music, environmental audio) |
| Audio length distribution | Varies by task; most reports exceed 30 seconds |
| Open data? | yes |

## 4. Evaluation protocol

- **Metric type**: Multi-type evaluation pipeline (classification, regression, sequence generation) using LLM-as-judge (GPT-4o) with constrained output formats for consistency. For classification tasks, LLM judge validates outputs. For regression, post-processor extracts numerical values. For sequence generation, applies original metrics (WER, BLEU, MOS).
- **Scoring details**: Relative score-based domain-level performance comparison; N/A rate tracking for instruction following; accuracy computed as percentage of outputs aligned with ground truth. For regression, N/A rate measured separately to assess instruction-following difficulty.
- **Models evaluated in the paper**: SALMONN-13B, LTU-AS, Whisper-LLaMA, SALMONN-7B, Qwen2-Audio-7B-Instruct, WavLLM, MU-LLaMA, GAMA, Qwen-Audio-Chat
- **Reproducibility**: All task data and evaluation pipeline open-sourced on GitHub; comprehensive results using GPT-4o reported in appendices; alternative evaluation with open-source LLaMA-3.1-8B-Instruct provided for reproducibility

## 5. Reported limitations

- L1: Benchmark lacks comprehensive speech-generation tasks; Phase-2 focused on understanding rather than generation due to evaluating foundation models trained primarily on speech data without broad generation capabilities
- L2: Automatic LLM-based evaluation correlates well with human evaluation but may not generalize to all future tasks; task taxonomy developed scientifically with community protocols maintained for future expansion
- L3: Some models trained on overlapping datasets with benchmark tasks (e.g., SALMONN on mixed speech/music/audio), limiting fair comparison; diverse performance reveals limited cross-domain generalizability despite specialized training

## 6. How this fits into our IPM survey §5

- **Benchmark family**: holistic
- **Goes into Table 3 row**: Dynamic-SUPERB Phase-2 (expansion from Phase-1: 55 to 180 tasks)
- **Goes into Figure 3 heatmap cells**: Speech (ASR, understanding, speaker traits, paralinguistics, emotion, safety), Audio & Music (emotion, music classification, sound events, instrument recognition), environment understanding, code-switching
- **Tier**: Tier-1 (largest benchmark covering 3 modalities: speech, music, audio)
- **Specific claim it supports**: Universal instruction-based speech models show strong performance on individual tasks but poor cross-domain generalization; models excel in specific domains but underperform across broader ranges
- **Gap it surfaces**: Need for better transfer learning mechanisms across acoustic modalities; limitations on music-related tasks despite multimodal pretraining; task-specific training still outperforms universal approaches

## 7. Risk / red flags

- Preprint with unverified claims? No — published at ICLR 2025 (peer-reviewed)
- Inflated SoTA / cherry-picked baselines? No — comprehensive evaluation includes 9+ publicly available models with diverse architectures; variable performance across tasks
- LLM-as-judge reliability issues? Potentially yes — uses GPT-4o with temperature=0 for consistency; acknowledges potential future behavior changes; validation with LLaMA-3.1-8B-Instruct provided but shows weaker correlation
- Coverage bias? Yes — inherits Phase-1 bias toward English ASR and classification; Phase-2 expands to music/audio but 180 tasks may not exhaustively capture emerging capabilities
- Reproducibility risk? Moderate — GPT-4o evaluation is proprietary with unpredictable updates; open-source LLaMA alternative provided but with performance degradation

## 8. One-paragraph summary (≤ 120 words, narrative form)

Dynamic-SUPERB Phase-2 is the largest benchmark for evaluating instruction-based universal spoken language models, expanding from 55 to 180 tasks across speech, music, and audio. Built through collaborative community efforts, it introduces a detailed task taxonomy and employs LLM-based evaluation pipelines to handle diverse output formats. Evaluations reveal no single model universalizes across all domains; SALMONN-13B excels in English ASR, Qwen2-Audio achieves high emotion recognition, and specialized models outperform generalist approaches. The benchmark exposes critical gaps in current universal models, particularly in music tasks and cross-domain generalization, providing a structured resource for advancing multimodal spoken language understanding.

---

## Note completion meta

- Completed by: Claude Code
- Completion date: 2026-06-06
- Confidence (1-5): 4
- Outstanding questions: Exact total sample counts across 180 tasks not provided; precise speaker demographics unspecified; quantification of training data overlap between models and benchmark not detailed
