# [#13] Audio2Tool: Speak, Call, Act - A Dataset for Benchmarking Speech Tool Use

---

## 0. Bibliographic metadata

- **Title**: Audio2Tool: Speak, Call, Act - A Dataset for Benchmarking Speech Tool Use
- **Authors**: Ramit Pahwa, Apoorva Beedu, Parivesh Priye, Rutu Gandhi, Saloni Takawale, Aruna Baijal, Zengli Yang
- **Year**: 2026
- **Venue**: Interspeech 2026 (submitted for review)
- **arXiv ID**: 2604.22821v2
- **Peer-reviewed?**: under review
- **Project page or code link**: https://audio2tool.github.io/
- **Date of latest version read**: 2026-04-28 (arXiv v2)

## 1. Motivation (≤ 5 lines)

Voice assistants increasingly rely on end-to-end SpeechLMs for audio-native tool calling, yet existing benchmarks lack domain breadth, acoustic diversity, and compositional reasoning complexity. While cascaded ASR-LLM pipelines have been extensively evaluated, large-scale audio-to-tool benchmarks with realistic acoustic conditions and multi-tier query hierarchies are missing. Current speech-centric benchmarks (AudioBench, VoiceAgentBench) suffer from limited taxonomic breadth, narrow acoustic diversity, and lack of structured multi-tier complexity, failing to reflect in-the-wild deployment scenarios.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [ ] **Speech QA / understanding**
- [ ] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [ ] **Paralinguistics — style / prosody**
- [x] **Multi-turn dialogue / interaction**
- [ ] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [x] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [x] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 30,000 queries |
| Number of tasks | 152 verified functions |
| Number of datasets / sub-benchmarks | 3 domains (Smart Car, Smart Home, Wearables); 8 complexity tiers; 23 functional categories |
| Languages covered | English (not explicitly stated for multilingual support) |
| Audio source (real / synthetic / mixed) | Synthetic (TTS via Qwen3TTS and CosyVoice-3) + mixed with noise profiles |
| Speaker diversity (count, demographics) | 330 speakers selected via stratified + farthest-point sampling from: SPGISpeech 2.0 (100), Emilia-Yodas (100), 3D Speaker (30), VoxPopuli (100); regions: US, Asia, Latin America, China, Europe |
| Audio length distribution | Tier 1: 2–6 words; Tier 2: 3–12 words; Tier 3: 4–18 words; Tier 4: 3–12 words; Tier 5: 25–60 words; Tier 6: 5–20 words; Tier 7: 20–200 words (2–4 turns); Tier 8: 4–18 words |
| Open data? | yes |

## 4. Evaluation protocol

- **Metric type**: Tool Accuracy (Acc), Exact Match (EM), Slot F1 (parameter-level); zero-shot evaluation
- **Scoring details**: Tool Accuracy: fraction of predictions where predicted tool(s) match ground truth (ordered for multi-call). EM: both tool(s) and all associated arguments exactly match ground truth after deterministic normalization. Slot F1: micro-averaged precision/recall/F1 treating each argument as a slot.
- **Models evaluated in the paper**: 5 end-to-end SpeechLMs (Step-Audio-2, AudioFlamingo-3, Kimi-Audio-7B, Qwen-2.5-Omni-7B, Qwen-3-Omni-30B; range 7B–30B); 2 ASR-LLM pipelines (Whisper 3 + Qwen 3, Whisper 3 + Gemma 3; range 1.7B–27B LLM components)
- **Reproducibility**: Code and dataset publicly available; closed-source LLMs used for query generation (GPT-5.2, Gemini 2.5 Pro, Claude Opus); manual verification for queries where LLM-as-judge disagreed

## 5. Reported limitations

- L1: Benchmark currently relies on synthetic TTS-generated speech; authors acknowledge need to incorporate real recordings for future work
- L2: Limited scope — 3 domains focused on IoT (smart car, home, wearables); safety-critical scenarios and broader domain coverage needed
- L3: Tier 8 (Intent Blending) evaluation limited to end-to-end SpeechLMs due to inherent audio-only nature; text-to-tool models not evaluated on this tier

## 6. How this fits into our IPM survey §5

- **Benchmark family**: agentic (tool use / function calling)
- **Goes into Table 3 row**: Audio2Tool (agentic, speech-to-tool pipeline evaluation)
- **Goes into Figure 3 heatmap cells**: Tool use (x), Robustness — noise (x), Multi-turn dialogue (x), ASR/transcription (x)
- **Tier**: Tier 1 (Domain-specific, production-ready benchmark with large scale and acoustic diversity)
- **Specific claim it supports**: Speech-to-tool reasoning requires both semantic and acoustic robustness; end-to-end SpeechLMs show strong performance on simple commands but significant degradation under compositional/multi-intent reasoning; synthetic audio with accent diversity + noise profiles effectively capture in-the-wild challenges
- **Gap it surfaces**: Current SpeechLMs (including largest models like Qwen-3-Omni-30B) fail sharply on intermediate-to-complex tiers (Tiers 3–4: EM <35%; Tiers 7–8: EM/F1 <56%); parameter grounding and multi-turn intent tracking remain major bottlenecks; end-to-end systems do not yet consistently outperform strong ASR-LLM cascades

## 7. Risk / red flags

- **Preprint with unverified claims?** MODERATE: Submitted for review to Interspeech 2026 (under review status); claims about SoTA SpeechLM performance are backed by systematic experiments across 8 tiers and multiple baseline models; LLM-as-judge setup with manual verification reduces risk of fabricated results
- **Inflated SoTA / cherry-picked baselines?** LOW: Comprehensive baseline coverage includes both end-to-end and cascaded approaches; models span 7B–30B parameter range; oracle Whisper + ground-truth setting included to isolate ASR error impact; no obvious cherry-picking
- **LLM-as-judge reliability issues?** LOW: LLM-as-judge used for query generation verification, not for evaluation scoring; manual verification applied when LLMs disagreed; actual evaluation uses deterministic metrics (exact match, F1)
- **Coverage bias?** MODERATE: Smart Car domain constitutes majority of queries (reflects focus on hands-free high-stakes environments); only 3 domains covered; English-only (no explicit multilingual evaluation); noise profiles limited to automotive/indoor HVAC/rain (not comprehensive cross-domain acoustic variability)
- **Reproducibility risk?** MODERATE: Closed-source LLMs used for query generation (GPT-5.2, Gemini 2.5 Pro, Claude Opus); TTS models proprietary (Qwen3TTS, CosyVoice-3); code and dataset promise public release but reproducibility of synthetic audio generation pipeline depends on access to these models

## 8. One-paragraph summary (≤ 120 words, narrative form)

Audio2Tool introduces a 30,000-query benchmark for evaluating speech-to-tool reasoning across three IoT domains (smart car, home, wearables). Its core innovation is an eight-tier query hierarchy progressing from simple direct commands to complex multi-intent and multi-turn interactions, complemented by realistic acoustic perturbations and diverse speaker voices. Experiments reveal end-to-end SpeechLMs achieve >75% accuracy on simple Tier 1 commands but degrade sharply on compositional tiers (Tier 3 EM <35%), with Qwen-3-Omni-30B outperforming peers yet still underperforming on multi-turn and intent-blending scenarios. The benchmark surfaces critical gaps in parameter grounding and multi-turn intent tracking, indicating that current audio-native models must improve robustness under realistic acoustic and compositional complexity.

---

## Note completion meta

- Completed by: Claude Haiku 4.5
- Completion date: 2026-06-06
- Confidence (1-5): 5
- Outstanding questions: None — all template fields completed with direct evidence from the PDF. Venue is "Interspeech 2026 (submitted for review)" per paper header; arXiv ID and version confirmed from first page.
