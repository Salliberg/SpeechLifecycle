# [#15] SeaLLMs-Audio: Large Audio-Language Models for Southeast Asia

---

## 0. Bibliographic metadata

- **Title**: SeaLLMs-Audio: Large Audio-Language Models for Southeast Asia
- **Authors**: Chaoqun Liu, Mahani Aljunied, Guizhen Chen, Hou Pong Chan, Weiwen Xu, Yu Rong, Wenxuan Zhang
- **Year**: 2025
- **Venue**: arXiv preprint
- **arXiv ID**: 2511.01670
- **Peer-reviewed?**: no
- **Project page or code link**: https://github.com/DAMO-NLP-SG/SeaLLMs-Audio; https://damo-nlp-sg.github.io/SeaLLMs-Audio/
- **Date of latest version read**: 2025-11-03

## 1. Motivation (≤ 5 lines)

Most existing LALMs support only one or two languages, primarily English, leaving multilingual and low-resource regions like Southeast Asia underrepresented. While progress has been made in text-based multilingual LLMs for SEA (SeaLLMs, Sailor, SEA-LION2), they lack audio processing capabilities. Additionally, existing audio benchmarks focus on specific tasks (e.g., ASR) rather than holistic multimodal evaluation. SeaLLMs-Audio bridges these gaps by introducing the first LALM tailored for SEA languages and a comprehensive benchmark (SeaBench-Audio).

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [x] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [x] **Paralinguistics — speaker traits**
- [ ] **Paralinguistics — style / prosody**
- [x] **Multi-turn dialogue / interaction**
- [x] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [x] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [x] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 1.58M conversations |
| Number of tasks | 14 benchmark tasks (ASR, S2TT, SS, SQA, CS, Safety, AC, AQA, SKI, SER, Life, Medical, Math, Fact) |
| Number of datasets / sub-benchmarks | 9 public source datasets + private data; 580 total benchmark questions (150 per SEA language, 130 for English) |
| Languages covered | Indonesian, Thai, Vietnamese, English, Chinese (5 languages; 7% Singlish also mentioned) |
| Audio source (real / synthetic / mixed) | Mixed: real audio from public datasets (GigaSpeech, GigaSpeech2, Common Voice, AudioCaps, VoiceAssistant-400, YODAS2, Multitask National Speech Corpus) + synthetic audio generated via Google TTS and gpt-4o-mini-tts |
| Speaker diversity (count, demographics) | NOT STATED |
| Audio length distribution | NOT STATED |
| Open data? | partial (training data curated from mix of public and private sources; code/model publicly available) |

## 4. Evaluation protocol

- **Metric type**: Mixed (human evaluation + LLM-as-a-judge). Human raters assessed responses on 1–5 scale; Gemini-2.5-flash used as judge with task-specific rubrics.
- **Scoring details**: 1–5 scale per task; language quality assessed separately (1–5, where 5 = entirely correct, no code-switching). Pearson correlation coefficient calculated between human and LLM judges (average 0.8). Agreement measured with and without ties (69% with tie, 93% without tie).
- **Models evaluated in the paper**: Qwen2-Audio-7B-Instruct, Qwen2.5-Omni-7B, MERaLiON-AudioLLM-Whisper-SEA-LION, MERaLiON-2-10B, SeaLLMs-Audio.
- **Reproducibility**: High. Dataset, model, and benchmark annotations prepared by professional native linguists. Detailed rubrics provided (Figure 8, Tables 3–4). Training procedure documented (1 epoch on 32 A100 GPUs, 6 days). LLM-as-a-judge pipeline explicitly described with template. Code publicly available.

## 5. Reported limitations

- L1: Confined to three SEA languages (Indonesian, Thai, Vietnamese) due to manpower and computational constraints; methodology is generalizable but not yet applied to other SEA languages.
- L2: Language mixing still occurs in outputs despite strong performance—a behavior also observed in other LALMs; identified for mitigation via reinforcement learning in future work.
- L3: Benchmark covers only 14 tasks and 580 questions per language; may not capture all audio-language phenomena or represent full task diversity in real-world applications.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: multilingual (with additional voice-assistant and task-specific elements)
- **Goes into Table 3 row**: SeaBench-Audio (comprehensive multilingual audio-language benchmark for SEA)
- **Goes into Figure 3 heatmap cells**: ASR, Speech QA, Paralinguistics (emotion, speaker traits), Safety, Audio environment, Multi-turn dialogue, Multilinguality/cross-lingual
- **Tier**: Tier 1 (comprehensive, peer-designed for specific region, strong LLM-as-judge validation with 0.8 correlation to human, 93% agreement without ties)
- **Specific claim it supports**: Regional benchmarks are essential for evaluating LALMs in low-resource, multilingual contexts; LLM-as-judge framework can achieve high correlation with human judgment when task-specific rubrics are used.
- **Gap it surfaces**: Absence of comprehensive audio-language benchmarks for Southeast Asia; language mixing remains a challenge in multilingual audio-language models despite training on curated multilingual data.

## 7. Risk / red flags

- **Preprint with unverified claims?** Yes—preprint status (arXiv:2511.01670, Nov 2025); claims of SoTA on SEA languages are not yet peer-reviewed. However, comprehensive comparisons with relevant baselines (Qwen2-Audio, Qwen2.5-Omni, MERaLiON variants) strengthen confidence.
- **Inflated SoTA / cherry-picked baselines?** Low risk. All compared models are contemporary LALMs of similar size; comparison baselines are representative (Qwen-Audio family, Omni variant, MERaLiON concurrent work). SeaLLMs-Audio does not achieve highest scores on all tasks (e.g., MERaLiON-2 wins on ASR, S2TT, SER; differences often modest).
- **LLM-as-judge reliability issues?** Low risk. Gemini-2.5-flash used; validation against human annotations achieved 0.8 Pearson correlation (high) and 93% agreement without ties (exceeds MT-bench baseline of 89%). Task-specific rubrics employed. Human evaluations were blind.
- **Coverage bias?** Moderate risk. Only 10 questions per task per language (150 total per SEA language); benchmark size is relatively small. Domains deliberately curated (customer service, medical, factual, etc.) but depth per domain is limited. No systematic analysis of inter-annotator agreement for benchmark construction.
- **Reproducibility risk?** Low. Dataset curation pipeline thoroughly documented with examples (Figure 1). Training details provided (1 epoch, 32 A100 GPUs, 6 days). Evaluation rubrics and prompt templates (Figures 4b, 8) fully disclosed. Code and model publicly available. Professional linguist involvement explicitly acknowledged.

## 8. One-paragraph summary (≤ 120 words, narrative form)

SeaLLMs-Audio is the first large audio-language model specifically designed for Southeast Asian languages (Indonesian, Thai, Vietnamese, English, Chinese), built by fine-tuning Qwen2-Audio-7B with Qwen2.5-7B-Instruct on 1.58M curated multilingual audio conversations spanning nine task categories. To evaluate it, the authors introduce SeaBench-Audio, a manually annotated benchmark of 580 questions across 14 tasks, employing Gemini-2.5-flash as a judge with task-specific rubrics. Validation against human raters achieved 0.8 Pearson correlation and 93% agreement without ties. SeaLLMs-Audio achieves best language quality on SEA languages and competitive or superior performance on knowledge-grounded tasks, though language mixing persists and benchmark coverage remains modest.

---

## Note completion meta

- Completed by: Claude Code
- Completion date: 2026-06-06
- Confidence (1-5): 4
- Outstanding questions: (1) Speaker demographic diversity in training corpus not quantified—difficult to assess representation bias. (2) No ablation on the audio adapter initialization strategy or impact of switching LLM components. (3) Scalability of data curation pipeline to additional SEA languages unclear. (4) Long-term reproducibility of benchmark depends on linguist availability for new task domains.
