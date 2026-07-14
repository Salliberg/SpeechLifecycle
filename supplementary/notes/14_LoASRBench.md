# [#14] LoASR-Bench: Evaluating Large Speech Language Models on Low-Resource Automatic Speech Recognition Across Language Families

---

## 0. Bibliographic metadata

- **Title**: LoASR-Bench: Evaluating Large Speech Language Models on Low-Resource Automatic Speech Recognition Across Language Families
- **Authors**: Jianan Chen, Xiaoxue Gao, Kawahara Tatsuya, Nancy F. Chen
- **Year**: 2026
- **Venue**: arXiv (not yet peer-reviewed)
- **arXiv ID**: 2603.20042v1
- **Peer-reviewed?**: no
- **Project page or code link**: Training code and checkpoints to be released upon acceptance
- **Date of latest version read**: March 20, 2026

## 1. Motivation (≤ 5 lines)

Existing speech language model (SpeechLM) benchmarks focus predominantly on high-resource languages, leaving ASR performance in low-resource scenarios poorly understood. This gap is critical for real-world deployment across diverse language families and scripts. LoASR-Bench addresses this by systematically evaluating state-of-the-art SpeechLMs (XLSR-53, Whisper, Qwen) across 25 low-resource languages spanning 9 typologically diverse language families, revealing that current models struggle with non-Latin scripts and extremely low-resource languages.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [ ] **Speech QA / understanding**
- [ ] **Paralinguistics — emotion**
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
| Total samples | NOT STATED |
| Number of tasks | 1 (ASR transcription) |
| Number of datasets / sub-benchmarks | 25 languages (using Common Voice 16.1) |
| Languages covered | 25 languages across 9 families: Dravidian (Tamil, Telugu, Malayalam), Romance (Portuguese, Spanish, French, Italian, Catalan, Galician, Romanian), Uralic (Estonian, Finnish, Hungarian), Isolate (Basque), Japonic (Japanese), Sino-Tibetan (Cantonese, Mandarin), Indo-Aryan (Hindi, Urdu, Assamese, Marathi, Bengali, Punjabi), Turkic (Tatar), Koreanic (Korean) |
| Audio source (real / synthetic / mixed) | Real (from Common Voice 16.1) |
| Speaker diversity (count, demographics) | NOT STATED |
| Audio length distribution | Training data duration ranges: 1-2670 hours per language (Tamil 233h, Spanish 549h, French 989h, Catalan 2670h; Telugu, Malayalam, Korean, Cantonese, Chinese, Hindi, Assamese, Marathi, Punjabi, Tatar with 1-64h) |
| Open data? | partial (based on Common Voice 16.1, which is open) |

## 4. Evaluation protocol

- **Metric type**: Character Error Rate (CER) for Latin-script languages; Word Error Rate (WER) for non-Latin scripts
- **Scoring details**: Script-aware validation during fine-tuning; CER used for Latin scripts, WER for non-Latin; text normalization applied consistently across all models and languages
- **Models evaluated in the paper**: XLSR-53 (0.04B parameters), Whisper-Medium (39M), Whisper-Large-v3 (1.5B), Qwen2-Audio-7B (7B), Qwen2-Audio fine-tuned (7B), Qwen3-Omni-30B (30B)
- **Reproducibility**: Unified training protocol with Hugging Face Transformers; 10 epochs, batch size 8, learning rate 5e-5, mixed-precision training (fp16); training code and checkpoints promised upon acceptance

## 5. Reported limitations

- L1: Significant performance gaps persist between Latin and non-Latin scripts, with frequent script confusion and language misidentification in non-Latin families
- L2: Languages with extremely limited training data (<1 hour: Telugu, Malayalam, Korean, Cantonese, Chinese, Hindi, Punjabi, Tatar) show substantially higher error rates, indicating data scarcity remains a deployment bottleneck
- L3: Model size alone provides minimal additional benefit—scaling from 0.04B to 30B parameters only reduces error rates from ~0.45 to 0.32; language identification is crucial for inference but may be unknown in real-world scenarios

## 6. How this fits into our IPM survey §5

- **Benchmark family**: multilingual
- **Goes into Table 3 row**: Multilingual ASR / Low-resource evaluation
- **Goes into Figure 3 heatmap cells**: ASR / transcription [x], Multilinguality / cross-lingual [x], Robustness — distribution shift / OOD [x]
- **Tier**: Tier 1 (comprehensive, systematic, recent 2026)
- **Specific claim it supports**: SpeechLMs show strong performance on high-resource and Latin-script languages but encounter unique challenges on typologically diverse, low-resource language families; language identification and script diversity significantly impact ASR performance
- **Gap it surfaces**: SpeechLMs inadequately handle non-Latin scripts (Dravidian, Indo-Aryan, Sino-Tibetan); deployment to real-world low-resource languages remains bottlenecked by data scarcity; cross-lingual transfer from high-resource languages does not fully compensate for low-resource constraints

## 7. Risk / red flags

- **Preprint with unverified claims?** Yes—marked for release of code/checkpoints upon acceptance; claims are well-supported by comprehensive experiments but peer review not yet completed
- **Inflated SoTA / cherry-picked baselines?** No—evaluation includes diverse state-of-the-art models (XLSR-53, Whisper family, Qwen family) across consistent evaluation protocol; results show realistic performance gaps
- **LLM-as-judge reliability issues?** No—uses standard metric types (CER/WER), not LLM-based scoring
- **Coverage bias?** Potential: benchmark focuses on Common Voice 16.1 data, which may not represent all acoustic conditions or demographics for low-resource languages; no mention of speaker diversity metrics or acoustic robustness testing
- **Reproducibility risk?** Moderate—code and checkpoints promised but not yet released; unified training protocol described but some implementation details (text normalization specifics) are underspecified

## 8. One-paragraph summary (≤ 120 words, narrative form)

LoASR-Bench is a multilingual ASR benchmark for evaluating speech language models on 25 low-resource languages across 9 typologically diverse language families, using Common Voice 16.1 data. The authors fine-tune XLSR-53, Whisper, and Qwen models under a unified protocol and conduct systematic evaluation revealing that while models achieve reasonable performance on Romance and Latin-script languages, they struggle significantly with non-Latin scripts (Dravidian, Indo-Aryan, Sino-Tibetan). Key findings: Latin-script languages average 0.27–0.43 error rates versus 0.44–0.62 for non-Latin scripts; language-aware prompting improves performance; and model size scales modestly. The benchmark highlights deployment risks for real-world low-resource language systems and data scarcity as a critical bottleneck.

---

## Note completion meta

- Completed by: Claude Haiku 4.5
- Completion date: 2026-06-06
- Confidence (1-5): 4
- Outstanding questions: Exact total sample count in benchmark dataset not stated in paper; speaker demographic diversity metrics for low-resource language splits not reported; acoustic robustness testing (noise, reverb) not covered—focus is purely on language/script diversity
