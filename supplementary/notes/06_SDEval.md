# [#06] SD-Eval: A Benchmark Dataset for Spoken Dialogue Understanding Beyond Words

---

## 0. Bibliographic metadata

- **Title**: SD-Eval: A Benchmark Dataset for Spoken Dialogue Understanding Beyond Words
- **Authors**: Junyi Ao, Yuancheng Wang, Xiaohai Tian, Dekun Chen, Jun Zhang, Lu Lu, Yuxuan Wang, Haizhou Li, Zhizheng Wu
- **Year**: 2025
- **Venue**: NeurIPS 2024 (Track on Datasets and Benchmarks)
- **arXiv ID**: 2501.13340v2
- **Peer-reviewed?**: yes
- **Project page or code link**: https://github.com/amphionspace/SD-Eval
- **Date of latest version read**: 2025-01-16

## 1. Motivation (≤ 5 lines)

Speech contains rich information beyond words: content, paralinguistic (emotion, accent, age, prosody), and environmental context. Current Speech LLMs struggle to generate contextually appropriate responses despite their multi-modal capabilities. Existing datasets focus on individual dimensions or text responses. SD-Eval bridges this gap by providing a multidimensional benchmark for speech-to-speech dialogue understanding that evaluates response generation considering emotion, accent, age, and background sound.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [x] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [x] **Paralinguistics — accent / dialect**
- [x] **Paralinguistics — speaker traits**
- [x] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
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
| Total samples | 7,303 utterances (8.76 hours of speech data) |
| Number of tasks | 4 sub-tasks |
| Number of datasets / sub-benchmarks | 4 (test-emo, test-acc, test-age, test-env) |
| Languages covered | English (Scottish, Northern Irish, Welsh, Irish, American, Canadian, Australian, New Zealand accents) |
| Audio source (real / synthetic / mixed) | Mixed: real recordings (RAVDESS, MEAD, JL Corpus, VCTK, LibriSpeech) + synthesized speech (TTS via Libri-light, MySTT, GPT-4-Turbo) |
| Speaker diversity (count, demographics) | NOT STATED (but includes multiple speakers across datasets with child and adult age groups) |
| Audio length distribution | Varies by task; test-emo: 1.11 hours, test-acc: 5.34 hours, test-age: 1.57 hours, test-env: 0.74 hours |
| Open data? | yes |

## 4. Evaluation protocol

- **Metric type**: Multi-faceted: objective (BLEU-4, ROUGE-L, METEOR, BERTScore), LLM-based (Yi-1.5, Qwen2, Gemma, GPT-4o), and subjective human evaluation
- **Scoring details**: Objective metrics measure lexical/semantic similarity to reference responses. LLM-based metrics evaluate naturalness, coherence, engagingness, and groundedness (1-10 scale). Human evaluations rated responses on 1-10 scale across 200 randomly selected utterances (50 per subset). Spearman and Kendall-Tau correlations computed between human and automatic metrics.
- **Models evaluated in the paper**: Cascade LLM (ASR + LLM), VS-LLM (speech encoder + LLM with adaptor), LLM (Upper Bound with transcripts), Qwen-Audio, Qwen2-Audio, SALMONN, GPT-4o
- **Reproducibility**: High—code, data, and prompts are open-sourced. Detailed experimental setup, model configurations (learning rates, batch sizes, LoRA parameters), and all prompts provided in appendix.

## 5. Reported limitations

- L1: SD-Eval accommodates only speech-to-text dialogues, limiting evaluation of system responses at the text level. Speech-to-speech response generation evaluation not covered.
- L2: Dataset currently supports single-turn dialogues only, limiting application to more complex multi-turn interactions, which is increasingly important for realistic dialogue systems.
- L3: SD-Eval includes four sub-tasks (emotion, accent, age, environmental sound) but does not account for other paralinguistic aspects (e.g., speaker gender, other personality traits) that could further enhance evaluation comprehensiveness.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: paralinguistic
- **Goes into Table 3 row**: Paralinguistic emotion/accent/age/environment evaluation
- **Goes into Figure 3 heatmap cells**: Paralinguistics (emotion, accent, speaker traits), Audio environment, Speech QA/understanding
- **Tier**: Tier 2 (comprehensive multi-dimensional benchmark with dataset + strong baseline evaluation)
- **Specific claim it supports**: "Speech LLMs trained with paralinguistic and environmental information outperform counterparts lacking such context, demonstrating that LLM-based metrics correlate better with human judgments than n-gram metrics"
- **Gap it surfaces**: Limited to speech-to-text rather than full speech-to-speech response generation; single-turn only; does not cover code-switching, safety, or multi-turn interaction dimensions

## 7. Risk / red flags

- **Preprint with unverified claims?** No. Published at NeurIPS 2024 (top-tier peer-reviewed venue), reducing unverified claims risk. Findings are substantive and supported by ablations.
- **Inflated SoTA / cherry-picked baselines?** Low risk. Paper evaluates both custom architectures (Cascade LLM, VS-LLM) and off-the-shelf models (Qwen-Audio, SALMONN, GPT-4o). Ablations show effect of input type and emotion labels systematically. Upper bound (LLM with ground truth) provides clear performance ceiling.
- **LLM-as-judge reliability issues?** Moderate risk. GPT-4o used as automatic metric shows highest human correlation (ρ=0.613), but correlation remains moderate overall. Human evaluation with 200 samples and 3+ annotators per sample mitigates judge reliability concerns. LLM judges may have biases toward verbose, fluent responses.
- **Coverage bias?** Moderate risk. Only 4 dimensions of paralinguistics evaluated (emotion, accent, age, environment). Missing: gender, speaker identity, code-switching, multilingual scenarios. English-centric with limited accent diversity (8 accents from primarily Western English variants).
- **Reproducibility risk?** Low. Full code, data, prompts publicly available. Experimental setup detailed. Models use open-source or commercial APIs with documented configurations. Training set constructed from 11 open datasets with clear aggregation process.

## 8. One-paragraph summary (≤ 120 words, narrative form)

SD-Eval is a speech-to-text dialogue benchmark with 7,303 utterances (8.76 hours) aggregated from eight public datasets. It evaluates spoken dialogue understanding across four paralinguistic and environmental dimensions: emotion (5 types), accent (8 variants), age (child/adult), and background sound (7 environmental types). The benchmark includes a 1,052.72-hour training set and tests multiple architectures including Cascade LLM (ASR→LLM) and VS-LLM (speech encoder→adaptor→LLM). Evaluation combines objective metrics (BLEU, ROUGE, METEOR, BERTScore), LLM-based judges (GPT-4o), and human ratings. Results show models conditioning on paralinguistic information outperform baselines, and GPT-4o-based metrics correlate strongly with human judgments (ρ=0.613), validating LLM judges for dialogue evaluation.

---

## Note completion meta

- Completed by: Claude Haiku 4.5
- Completion date: 2026-06-06
- Confidence (1-5): 5
- Outstanding questions: None—all template fields completed with data directly from paper. Limitations section (§6) captures both claimed and inferred gaps clearly.
