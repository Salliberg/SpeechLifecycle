# [#11] StyleBench: Evaluating Speech Language Models on Conversational Speaking Style Control

---

## 0. Bibliographic metadata

- **Title**: StyleBench: Evaluating Speech Language Models on Conversational Speaking Style Control
- **Authors**: Haishu Zhao, Aokai Hao, Yuan Ge, Zhenqiang Hong, Tong Xiao, Jingbo Zhu
- **Year**: 2026
- **Venue**: arXiv
- **arXiv ID**: 2603.07599v1
- **Peer-reviewed?**: no
- **Project page or code link**: Datasets to be released after paper acceptance
- **Date of latest version read**: March 8, 2026

## 1. Motivation (≤ 5 lines)

Speech language models have gained capability to control speaking style intensity, but systematic evaluation of this ability in multi-turn conversations remains absent. Prior benchmarks (AudioBench, SpeechFeedback) evaluate single-turn tasks or only emotional categories without quantifying intensity variation across dialogue turns. There is an urgent need for benchmarks that assess style intensity control across multiple dimensions (emotion, speed, volume, pitch) in realistic interactive scenarios.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [ ] **ASR / transcription**
- [ ] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [x] **Paralinguistics — style / prosody**
- [x] **Multi-turn dialogue / interaction**
- [x] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding**
- [x] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 14,400 three-turn dialogues (96,400 utterances total) |
| Number of tasks | 4 (emotion, speed, volume, pitch) |
| Number of datasets / sub-benchmarks | 4 style dimensions |
| Languages covered | 2 (English and Mandarin Chinese) |
| Audio source (real / synthetic / mixed) | Synthetic (CosyVoice2 for base utterances; RAVDESS reference audio for emotion intensity) |
| Speaker diversity (count, demographics) | 8 speakers per dimension (4 English, 4 Mandarin); speaker gender/age NOT STATED |
| Audio length distribution | Emotion: 84.88h; Speed: 11.76h; Volume: 9.54h; Pitch: 9.35h (total 115.53h) |
| Open data? | partial (datasets promised after paper acceptance; not yet released) |

## 4. Evaluation protocol

- **Metric type**: Hybrid automatic + manual: Valid Sample Percentage (VSP, human judgment); Style Variation Degree (SVD, automatic for Speed/Volume/Pitch); semantic relevance via Qwen3-4B-Instruct
- **Scoring details**: VSP measures probability model produces distinct stylistic output matching prompt intent (0-100%). SVD quantifies acoustic intensity shift between consecutive turns using absolute percentage change: ∆1 = |ST2 − ST1|/ST1 × 100%, ∆2 = |ST3 − ST2|/ST2 × 100%. Speed = syllables per minute (Whisper-large-v3), Volume = RMS energy, Pitch = average F0. Emotional classification via manual review due to unreliability of Emotion2Vec on synthesized data.
- **Models evaluated in the paper**: 10 open-source SLMs: Mini-omni (0.5B), Mini-omni2 (0.5B), Slam-omni (0.5B), Freeze-omni (7B), MiniCPM-o 2.6 (7B), Qwen2.5-omni (7B), Baichuan-omni-1.5 (7B), LLaMA-omni2 (8B), GLM-4-Voice (9B), Kimi-Audio (7B)
- **Reproducibility**: 10% dataset reserved for evaluation; three-stage evaluation strategy (single-turn relevance → multi-turn coherence → style control) described; all baseline models open-source; metrics derivable from outputs; code/datasets promised post-acceptance but not yet available

## 5. Reported limitations

- L1: Emotional classification reliability degrades for synthesized data; Emotion2Vec and softmax confidence scores saturate (>0.95) and fail to capture fine-grained intensity variations, necessitating human evaluation without reported inter-annotator agreement
- L2: Dataset entirely synthetic using CosyVoice2 and FFmpeg post-processing; does not reflect naturally-produced style variations, speaker idiosyncrasies, or cumulative acoustic fatigue in real multi-turn conversations
- L3: Analysis limited to open-source models (10 total); does not include proprietary systems (GPT-4o, Anthropic Claude, Google Gemini); MRD > 40% filtering threshold introduces selection bias; decoder architecture and other factors affecting style reproduction not comprehensively explored

## 6. How this fits into our IPM survey §5

- **Benchmark family**: paralinguistic
- **Goes into Table 3 row**: Speech Language Models — Paralinguistic & Conversational Style Control
- **Goes into Figure 3 heatmap cells**: Paralinguistics — emotion [x], Paralinguistics — style/prosody [x], Multi-turn dialogue/interaction [x], Multilinguality [x], Speech generation quality [x]
- **Tier**: Tier 2 (2026 preprint; newly published, focused but comprehensive within scope)
- **Specific claim it supports**: "Style intensity control capability is unevenly distributed among SLMs despite similar model sizes; training data explicitly curated for style (Kimi-Audio, GLM-4-Voice) and speech tokenizer design are critical factors determining controllability"
- **Gap it surfaces**: (1) Multi-turn dialogue coherence is necessary prerequisite for style control; (2) OLMs optimized for QA/ASR lack style-aware training despite comparable parameters; (3) Speech tokenizers preserve or erase paralinguistic cues — design choices matter more than decoder choice

## 7. Risk / red flags

- **Preprint with unverified claims?** Yes — paper on arXiv v1 (March 2026), not yet peer-reviewed. Claims about root causes (data composition, tokenizer design) are post-hoc analysis without ablation or controlled experiments. Dataset unavailable for independent verification.
- **Inflated SoTA / cherry-picked baselines?** Moderate — baseline selection includes both top performers (Kimi-Audio, GLM-4-Voice, VSP 81.88%/78.75% on Speed) and weak performers (LLaMA-omni2, Baichuan show minimal response). No proprietary models included. MRD > 40% threshold for "eligible" models introduces visibility bias toward models trained on multi-turn data.
- **LLM-as-judge reliability issues?** Yes — human VSP evaluation lacks inter-annotator agreement, disagreement resolution protocol, or annotator qualifications. Qwen3-4B-Instruct used to score semantic relevance (MRD); reliability on this task not independently validated. Emotion classification uses manual review but reviewer identity/training not disclosed.
- **Coverage bias?** Yes — only 2 languages (English, Mandarin); 8 speakers per condition with demographics unreported; 6 emotion categories (missing complex states like ambivalence, sarcasm, irony); prosodic dimensions (speed, volume, pitch) incomplete (missing intonation patterns, pausing, emphasis). Assumes three-turn maximum; does not test longer conversations.
- **Reproducibility risk?** Moderate-High — datasets not yet released; exact FFmpeg parameters for speed/volume/pitch synthesis not specified; emotional reference audio selection from RAVDESS not fully detailed; prompting strategy for multi-turn style requests shows examples but not full protocol; human evaluation lacks guidelines/rubric; CosyVoice2 version/configuration not pinned.

## 8. One-paragraph summary (≤ 120 words, narrative form)

StyleBench is a bilingual benchmark for evaluating speech language models' ability to control speaking style intensity across emotion, speed, volume, and pitch in multi-turn conversations. The dataset comprises 14.4K three-turn dialogues (115.53 hours) synthesized with CosyVoice2 and FFmpeg post-processing, evenly split between English and Mandarin with 8 speakers per dimension. Evaluation combines Valid Sample Percentage (VSP, measuring response distinctiveness) and Style Variation Degree (SVD, quantifying intensity shifts). Results from 10 open-source SLMs reveal substantial performance gaps: Kimi-Audio and GLM-4-Voice achieve 78–82% VSP on prosodic dimensions, while OLMs optimized for QA show minimal responsiveness. Analysis attributes differences to training data and speech tokenizer design, suggesting avenues for improving style control.

---

## Note completion meta

- Completed by: Claude Code Agent
- Completion date: June 6, 2026
- Confidence (1-5): 4
- Outstanding questions: (1) Inter-annotator agreement and disagreement protocol for VSP judgments not disclosed. (2) Why MRD > 40% threshold? Sensitivity analysis on filtering criteria absent. (3) FFmpeg exact parameters (speed ratios, volume gains, pitch shifts) not specified. (4) Speaker demographics (age, gender) not provided. (5) Dataset release status / timeline unclear. (6) Why only 6 emotions (not 7+ basic emotions or complex states)? (7) How were prompts phrased conversationally — examples shown but full prompt templates not provided.
