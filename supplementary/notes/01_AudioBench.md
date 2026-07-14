# [#01] AudioBench: A Universal Benchmark for Audio Large Language Models

---

## 0. Bibliographic metadata

- **Title**: AudioBench: A Universal Benchmark for Audio Large Language Models
- **Authors**: Bin Wang, Wenyu Zhang, Zhengyuan Liu, Geyu Lin, Shuo Sun, AiTi Aw, Nancy F. Chen, Zhuohan Liu, Xunlong Zou
- **Year**: 2025
- **Venue**: arXiv preprint (submitted to major conference, May 2025 version)
- **arXiv ID**: 2406.1602w5 [SD] (preprint identifier visible in header)
- **Peer-reviewed?**: under review
- **Project page or code link**: https://github.com/AudioLLMs/AudioBench
- **Date of latest version read**: 2025-05-06

## 1. Motivation (≤ 5 lines)

AudioLLMs lack a comprehensive, unified evaluation benchmark covering diverse audio understanding tasks. Existing benchmarks (Open-Audio-Chat, SALMONN, AIR-Bench) are fragmented—each tests limited task subsets with different metrics. AudioBench addresses this gap by providing 8 standardized tasks across 26 datasets, covering speech understanding, audio scene comprehension, and voice understanding in a single framework suitable for instruction-following capability evaluation.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

Mark `[x]` if the benchmark explicitly evaluates this capability, otherwise `[ ]`.

- [x] **ASR / transcription**
- [x] **Speech QA / understanding** (semantic comprehension of spoken content)
- [x] **Paralinguistics — emotion**
- [x] **Paralinguistics — accent / dialect**
- [x] **Paralinguistics — speaker traits** (age / gender / identity)
- [ ] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [ ] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [x] **Audio environment / scene understanding** (non-speech audio)
- [ ] **Speech generation quality** (TTS-MOS-style)
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 100k+ samples across 26 datasets |
| Number of tasks | 8 tasks |
| Number of datasets / sub-benchmarks | 26 datasets |
| Languages covered | English only |
| Audio source (real / synthetic / mixed) | Mixed (real recordings + synthesized speech via TTS for instruction datasets) |
| Speaker diversity (count, demographics) | NOT STATED (metadata mentioned for some datasets: 60 speakers in DREAM-TTS; diverse public speakers in Public-SG-SpeechQA; gender diversity noted for VoxCeleb-derived datasets) |
| Audio length distribution | 0.08–304.9 seconds (avg length varies: ASR 7.43–34.96s; SQA 3.2–261.85s; AQA 9.86–30.62s) |
| Open data? | partial (7 of 26 datasets are newly collected/adapted; majority are existing open-source datasets) |

## 4. Evaluation protocol

- **Metric type**: Mixed (rule-based + LLM-as-judge)
- **Scoring details**: 
  - ASR: Word Error Rate (WER)
  - Emotion Recognition (ER), Accent Recognition (AR), Gender Recognition (GR): Model-as-Judge (M.J.) using Llama-3-70B-Instruct
  - Audio Captioning (AC): METEOR score + M.J.
  - Speech Question Answering (SQA) and Audio-Scene Question Answering (AQA): M.J. (0–5 scale after rescaling from 0–1 for easier comparison)
  - Speech Instruction (SI): M.J.
  - Model-as-judge uses Llama-3-70B-Instruct and Llama-3-8B-Instruct; Prometheus-2 also evaluated; responses rated 0–5 with rubric guidance
- **Models evaluated in the paper**: SALMONN, Qwen-Audio-Chat, WavLLM, Qwen2-Audio-Instruct, Whisper+Llama3 (cascade baseline)
- **Reproducibility**: Open code (GitHub link provided); evaluation toolkit available; detailed prompts in appendix

## 5. Reported limitations (cite the paper itself, not your opinion)

- L1: "AudioBench exclusively includes English semantics and code-switching are crucial for comprehensive speech understanding and generation. We plan to expand the benchmark to incorporate multilingual capabilities and code-switching aspects in future iterations."
- L2: "Similar to text-based LLMs, evaluating free-style generation is challenging and demanding robust metrics or models to serve as judges. Traditional metrics fall short in zero-shot scenarios, and assessing the correctness of output responses is complex."
- L3: "As end-to-end models, AudioLLMs typically involve large model sizes, which result in longer inference times. In this benchmark, our focus has been primarily on accuracy rather than efficiency. Moving forward, it will be important to consider inference speed and the deployment environment to comprehensively evaluate these models during the deployment process."

## 6. How this fits into our IPM survey §5

- **Benchmark family**: holistic (covers multiple audio understanding dimensions: speech understanding, audio scene understanding, voice understanding)
- **Goes into Table 3 row**: AudioBench (primary entry as comprehensive benchmark)
- **Goes into Figure 3 heatmap cells**: 
  - ASR / transcription [x]
  - Speech QA / understanding [x]
  - Paralinguistics — emotion [x]
  - Paralinguistics — accent [x]
  - Paralinguistics — speaker traits [x]
  - Audio environment / scene understanding [x]
- **Tier**: Tier 1 (comprehensive, recent, peer-reviewed submission, multiple tasks and models evaluated)
- **Specific claim it supports**: "Holistic evaluation of AudioLLMs requires standardized tasks spanning speech understanding, audio scene comprehension, and voice understanding characteristics."
- **Gap it surfaces**: Fragmentation of prior AudioLLM evaluation (different datasets, inconsistent metrics) and absence of English-focused but systematic instruction-following evaluation framework for diverse audio modalities.

## 7. Risk / red flags (be skeptical)

- **Preprint with unverified claims?** MODERATE: Submitted to peer review (May 2025), but not yet peer-reviewed. Claims of superiority (e.g., Llama-3-70B-Instruct outperforming Prometheus-2 as judge) are internally validated via correlation study (Spearman's rank) but not externally reviewed. Model selection rationale justified.

- **Inflated SoTA / cherry-picked baselines?** LOW: Five diverse models evaluated (SALMONN, Qwen-Audio, WavLLM, Qwen2-Audio, Whisper+Llama3 cascade). No single model excels across all tasks—findings actually highlight fragmented capabilities. Honest reporting: "None of the models performed exceptionally well across all criteria."

- **LLM-as-judge reliability issues?** MODERATE: Llama-3-70B-Instruct chosen as primary judge with post-hoc validation via Spearman correlation study. Prometheus-2 compared but deemed "not ideal." Limited external validation (not cross-correlated with human judges on representative samples). Rescaling from 0–1 to 0–5 scale may introduce artifacts. No inter-rater reliability (multiple judge comparison) reported beyond Prometheus-2.

- **Coverage bias (English-dominant / single domain / synthetic-only)?** MODERATE-HIGH: 
  - English-only: acknowledged limitation; multilingual stated as future work.
  - Mixed real/synthetic audio: 7 new datasets use TTS-synthesized instructions; authors report ~90% filtering to ensure naturalness, retaining ~10%, but potential for synthetic artifacts remains.
  - Domain coverage: 26 datasets span ASR (9 datasets), SQA (4), SI (2), AQA (3), AC (2), ER (3), AR (1), GR (2)—reasonable breadth but skewed toward speech understanding (13/26).

- **Reproducibility risk (closed model / closed data / no code)?** LOW: 
  - Code available (GitHub link: https://github.com/AudioLLMs/AudioBench).
  - Primary judge (Llama-3-70B-Instruct) open-weight.
  - 19/26 datasets are existing open-source (LibriSpeech, CommonVoice, VoxCeleb, MELD, etc.).
  - 7 newly collected/adapted datasets (CN-College-Listen, DREAM-TTS, Public-SG-SpeechQA, WavCaps-QA, AudioCaps-QA, OpenHermes-Audio, ALPACA-Audio) require careful review of data release plans—authors mention labeling platform usage but data availability not explicitly stated for all.

## 8. One-paragraph summary (≤ 120 words, narrative form)

AudioBench introduces the first comprehensive evaluation framework for instruction-following Audio Large Language Models, unifying previously fragmented benchmarking efforts. It comprises eight tasks—ASR, speech question answering, speech instruction, audio-scene question answering, audio captioning, emotion recognition, accent recognition, and gender recognition—distributed across 26 datasets (100k+ samples) and averaging 400+ hours of audio. The benchmark employs model-as-judge evaluation (Llama-3-70B-Instruct) validated via correlation analysis, alongside traditional metrics (WER, METEOR). Evaluation of five representative models reveals no single system excels uniformly, surfacing capability gaps in long-form audio handling and robustness to instruction variance. The work addresses a critical gap in AudioLLM evaluation methodology and provides an open-source toolkit for future development.

---

## Note completion meta

- Completed by: Claude Code Agent (Haiku 4.5)
- Completion date: 2026-06-06
- Confidence (1-5): 4
- Outstanding questions:
  1. Data release timeline for 7 newly collected/adapted datasets (CN-College-Listen, DREAM-TTS, Public-SG-SpeechQA, WavCaps-QA, AudioCaps-QA, OpenHermes-Audio, ALPACA-Audio)—are all open or partially restricted?
  2. Human judgment validation: Were human-rated samples collected for inter-judge agreement analysis beyond LLM-as-judge comparison?
  3. Long-form audio segmentation: Paper mentions segmenting long audio to smaller chunks for assessment—what are exact thresholds and potential bias introduced?
  4. Multilingual roadmap: Which languages prioritized for expansion given practical constraints?
