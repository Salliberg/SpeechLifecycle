# [#09] Towards Fine-Grained Multi-Dimensional Speech Understanding: Data Pipeline, Benchmark, and Model

---

## 0. Bibliographic metadata

- **Title**: Towards Fine-Grained Multi-Dimensional Speech Understanding: Data Pipeline, Benchmark, and Model
- **Authors**: Guojian Li, Zhixian Zhao, Zhennan Lin, Jingbin Hu, Qirui Zhan, Yuang Cao, Pengyuan Xie, Chuan Xie, Jie Liu, Qiang Zhang, Zhonghua Fu, Lei Xie
- **Year**: 2026
- **Venue**: arXiv
- **arXiv ID**: 2605.12036v1
- **Peer-reviewed?**: no
- **Project page or code link**: https://github.com/ASLP-lab/FMSU
- **Date of latest version read**: 2026-05-12

## 1. Motivation (≤ 5 lines)

Current speech LLMs excel at conventional tasks like ASR but lack fine-grained, multi-dimensional perception of real-world speech. They struggle with micro-acoustic cues, acoustic scenes, and paralinguistic signals due to three factors: scarcity of high-quality expressive data, absence of fine-grained modeling for multi-dimensional attributes, and reliance on coarse-grained benchmarks. This limitation bottlenecks development of perceptive and empathetic next-generation speech systems.

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
| Total samples | 24,000+ (20,000+ bilingual benchmark instances; 2.3M training instances) |
| Number of tasks | 14 distinct speech attribute dimensions |
| Number of datasets / sub-benchmarks | 5-tier taxonomy (Speaker Demographics, Acoustic-Prosodic Features, Affective and Semantic Reasoning, Acoustic Scene Analysis, Linguistic-Paralinguistic Integration) |
| Languages covered | Chinese and English (bilingual) |
| Audio source (real / synthetic / mixed) | Real (extracted from movies and TV shows) |
| Speaker diversity (count, demographics) | NOT STATED |
| Audio length distribution | 500 to 1,000 manually verified samples per attribute; minimum 3 seconds per sample |
| Open data? | yes |

## 4. Evaluation protocol

- **Metric type**: Accuracy for 13 MCQ tasks; Paralinguistic-Aware Transcription Accuracy (PATA) for open-ended transcription task
- **Scoring details**: Standard accuracy ratio for MCQs. PATA = α · max(0, 1 − ERRtext) + (1 − α) · F1para, with α = 0.5. MCQs designed with fine-grained acoustic distractors and semantic trap distractors to probe genuine auditory perception vs. text-reliance hallucinations.
- **Models evaluated in the paper**: FM-Speech, Audio Flamingo 3, Qwen3-Omni, Kimi-Audio, Step-Audio 2, OmniCaptioner, Mimo-Audio, Qwen2.5-Omni, Qwen2-Audio, Gemini 2.5 Flash, Gemini 3 Flash, Gemini 3.1 Pro
- **Reproducibility**: High. Open-source models deployed locally with official configurations on 8 NVIDIA L20 GPUs. Proprietary models via official APIs. Adaptive evaluation protocols detailed for different task paradigms.

## 5. Reported limitations

- L1: Multi-expert cross-validation with multiple models (Qwen3-ASR, emotion2vec, Step-Audio-R1, WavLM, Wav2Vec-BERT) may introduce cascading errors or biases if component models consistently misclassify certain speech attributes.
- L2: Manual verification protocol (two independent experts reviewing all 20,000+ samples) creates potential for subjective judgment variance, particularly for nuanced attributes like "tone" and "voice texture."
- L3: Benchmark focuses primarily on Chinese and English; multilingual generalization to other language families (e.g., tonal, agglutinative, polysynthetic languages) remains unexplored.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: holistic
- **Goes into Table 3 row**: FMSU-Bench / Fine-grained Multi-dimensional Speech Understanding
- **Goes into Figure 3 heatmap cells**: Covers speaker demographics (GEN, AGE, ACC), acoustic-prosodic (PIT, SR, RHY, VT), affective-semantic (EMO, TON, CI), acoustic scene (BS, AE), and linguistic-paralinguistic (PE, TPT)
- **Tier**: Tier 1 (comprehensive, multi-dimensional, manually verified, large scale)
- **Specific claim it supports**: Speech LLMs require substantial improvement in fine-grained, multi-dimensional understanding; open-source models can match proprietary performance with good data curation and progressive training.
- **Gap it surfaces**: Critical capability gap between semantic-level comprehension and true micro-acoustic perception; models excel at coarse tasks (gender, emotion) but collapse on subtle acoustic features (pitch, voice texture, background sound, paralinguistic events).

## 7. Risk / red flags

- **Preprint with unverified claims?** Yes — arXiv preprint (2605.12036v1) dated May 2026; no peer review indicated. Claims of "SOTA among open-source models" require external validation.
- **Inflated SoTA / cherry-picked baselines?** Partial risk. Evaluation includes 11 models (8 open-source, 3 proprietary); however, no comparison with other concurrent multi-dimensional benchmarks (AIR-Bench, MMAR, MMAU, MMSU, HPSU) on identical subsets to isolate benchmark difficulty vs. model capability.
- **LLM-as-judge reliability issues?** Moderate risk. Gemini 2.5 Pro used as primary annotator with multi-expert cross-validation, but Gemini hallucinations explicitly acknowledged and mitigated via strong priors. Timestamp hallucinations during long-audio chunking were a known issue; manual verification provides some assurance.
- **Coverage bias?** Yes. Audio sourced exclusively from movies/TV (expressive in-the-wild) may over-represent dramatic, acted speech vs. naturalistic conversational speech. Only 2 languages (Chinese, English); no coverage of low-resource languages, rare dialects, or specialized acoustic domains (clinical speech, singing, whispered speech).
- **Reproducibility risk?** Low-to-moderate. Code repository linked (https://github.com/ASLP-lab/FMSU). Training details provided (LoRA, MS-Swift, Megatron-LM, hardware specs), but 2.3M training corpus not explicitly promised to be released; benchmark test set (20k+) is released but training data curation pipeline may not be fully reproducible without internal Gemini 2.5 Pro access for large-scale annotation.

## 8. One-paragraph summary (≤ 120 words, narrative form)

FMSU-Bench is a comprehensive 14-dimensional bilingual benchmark (Chinese/English) for fine-grained speech understanding, comprising 20,000+ manually verified instances. It systematically evaluates speaker demographics, acoustic-prosodic features, emotion/tone/inference, acoustic scene analysis, and paralinguistic integration—dimensions largely absent from prior benchmarks. The paper presents a robust LLM-driven data curation pipeline (with multi-expert cross-validation) extracting high-quality expressive speech from movies/TV, and FM-Speech, a model using progressive curriculum fine-tuning that achieves 72.8% average accuracy, outperforming open-source baselines and approaching proprietary models. The benchmark exposes a critical gap: models excel at coarse semantic tasks but fail at micro-acoustic perception, establishing a rigorous new standard for evaluating fine-grained auditory capabilities.

---

## Note completion meta

- Completed by: Claude Code
- Completion date: 2026-06-06
- Confidence (1-5): 5
- Outstanding questions: None—all required fields completed from PDF content. Paper provides comprehensive specifications, evaluation results, and methodology details.
