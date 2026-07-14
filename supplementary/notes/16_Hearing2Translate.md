# [#16] Hearing to Translate: The Effectiveness of Speech Modality Integration into LLMs

---

## 0. Bibliographic metadata

- **Title**: Hearing to Translate: The Effectiveness of Speech Modality Integration into LLMs
- **Authors**: Sara Papi, Javier Garcia Gilabert, Zachary Hopton, Vilém Zouhar, Carlos Escolano, Gerard I. Gállego, Jorge Iranzo-Sánchez, Ahrii Kim, Dominik Macháček, Patricia Schmidtová, Maike Zütile
- **Year**: 2026 (April 2025 submission, arXiv version dated 25 Apr 2026)
- **Venue**: ACL (Association for Computational Linguistics)
- **arXiv ID**: arXiv:2512.16378v4
- **Peer-reviewed?**: under review
- **Project page or code link**: https://github.com/sara-apapi/hearing2translate
- **Date of latest version read**: 2026-06-06

## 1. Motivation (≤ 5 lines)

The paper evaluates whether integrating speech modality directly into large language models (LLMs) improves speech-to-text translation compared to traditional cascaded approaches. Prior work has not systematically verified if SpeechLLMs can match or surpass cascaded systems combining powerful speech foundation models (SFMs) with high-performing LLMs. This work presents the first comprehensive benchmark suite (Hearing-to-Translate) testing 22 ST systems across 13 language pairs, 9 phenomena, and 16 benchmarks, addressing whether direct speech-to-LLM integration offers genuine advantages for translation quality, robustness, and generalization.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [x] **ASR / transcription**
- [ ] **Speech QA / understanding**
- [x] **Paralinguistics — emotion**
- [x] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [x] **Paralinguistics — style / prosody**
- [ ] **Multi-turn dialogue / interaction**
- [x] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [x] **Robustness — noise / acoustic perturbation**
- [x] **Robustness — distribution shift / OOD**
- [ ] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [ ] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [x] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | NOT STATED (varies per benchmark; 16 benchmarks total covering diverse audio segments) |
| Number of tasks | 9 phenomena-specific conditions + baseline GENERIC |
| Number of datasets / sub-benchmarks | 16 benchmarks (FLEURS, CoVoST2, EuroParl-ST, WMT, WinoST, CommonAccent, ManDi, CS-Dialogue, CS-FLEURS, LibriStutter, NEuRoparIST, NoisyFLEURS, EmotionTalk, mExpresso, ACL 60/60, MCIF) |
| Languages covered | 13 language pairs covering 9 diverse language variants; languages include: de, fr, it, es, pt, zh, en, and others; 52 languages in CS-FLEURS |
| Audio source (real / synthetic / mixed) | Mixed (real speech from various sources including YouTube, parliamentary debates, Common Voice, professional recordings) |
| Speaker diversity (count, demographics) | Diverse across gender (male/female speaker sets), accents (7+ regional accents per language pair), emotions (7 emotion types in EmotionTalk) |
| Audio length distribution | Variable; ranges from short segments to long-form audio (up to 600+ seconds tested); specific focus on long-form robustness |
| Open data? | partial (multiple CC-BY licenses; some custom benchmarks; data released at https://huggingface.co/datasets/maikezu/noisy-fleurs) |

## 4. Evaluation protocol

- **Metric type**: Reference-based translation quality (xCOMET-QE, METRICX-QE) with quality estimation fallback; gap-based metrics for robustness (ΔF1, Δ_gender, Δ_accent, Δ_disfluency, Δ_noise, Δ_length); case-sensitive accuracy (%NE, %term) for terminology
- **Scoring details**: xCOMET-QE and METRICX-QE (modified versions with strict penalty for off-target outputs); gap formulation: Δ = 100 · (Q_A − Q_B) / Q_A; gender gap via Stereotypical Gap (ΔS_s,σ); accent gap via standard deviation of xCOMET-QE across accents
- **Models evaluated in the paper**: 22 systems: 6 SFMs (Whisper, Seamless, Canary, OWSM, DeSTa2, Voxral, Spire) in cascade + direct; 8 LLMs (Aya, Gemma3, Tower+, Tower+, Whisper+cascades); 9 SpeechLLMs (Phi-4-Multimodal, Qwen2-Audio, Qwen3-Omni, DeSTA2, DeSTa2, Voxral, Spire); plus proprietary Gemini-2.5-flash comparison
- **Reproducibility**: Standardized prompts (WMT 2025 format); Python 3.9.16 evaluation; xCOMET v2.2.2 with f32 precision; METRICX via Google comet library; human evaluation via Permut protocol on subset (small-scale); all code and prompts provided

## 5. Reported limitations

- L1: Analysis remains English-centric, reflecting current SpeechLLM language support; expanding to fully multilingual setup requires broader model coverage and additional resources
- L2: Does not report results for traditional neural MT models, focusing instead on comparing cascaded vs. direct SpeechLLM architectures; does not include toxicity or safety benchmarks (no publicly available datasets currently target speech-to-text translation safety)
- L3: Quality estimation metrics (xCOMET-QE, METRICX-QE) are known to be imperfect and offer limited insight into specific error types; segment-level alignment remains challenging without reference translations

## 6. How this fits into our IPM survey §5

- **Benchmark family**: task-specific (speech-to-text translation evaluation suite)
- **Goes into Table 3 row**: Speech Translation Benchmarks
- **Goes into Figure 3 heatmap cells**: ASR/transcription, Paralinguistics—emotion, Paralinguistics—accent/dialect, Paralinguistics—style/prosody, Multilinguality/cross-lingual, Robustness—noise, Robustness—distribution shift, Code-switching
- **Tier**: Tier 1 (comprehensive, systematic evaluation; large-scale comparison; multiple phenomena; diverse language pairs)
- **Specific claim it supports**: "Cascaded systems remain most reliable; SpeechLLMs show growing potential but do not universally dominate; robustness is phenomenon-dependent and not architecture-agnostic"
- **Gap it surfaces**: Current evaluation lacks standardized metrics for stream/latency trade-offs; gaps remain in assessing fairness across underrepresented language pairs and speaker demographics; safety/toxicity evaluation for ST systems is missing

## 7. Risk / red flags

- **Preprint with unverified claims?**: No — preprint has undergone substantial internal validation with human evaluation. Claims are carefully qualified (e.g., "growing potential" rather than definitive superiority claims). Results show both strengths and weaknesses of each paradigm.
- **Inflated SoTA / cherry-picked baselines?**: No — evaluation includes diverse model classes (SFMs, LLMs, SpeechLLMs, cascades, direct); models span size ranges (7B–32B parameters); results report failures clearly (e.g., Seamless struggles with accents, Whisper lags on named entities).
- **LLM-as-judge reliability issues?**: Partially mitigated — xCOMET/METRICX validation against human judgment shows Pearson r=0.57 (METRICX) at system level, comparable to reference-based metrics; however, segment-level correlation remains weaker (0.5 micro-Pearson); small-scale human eval (80 items per language pair) provides ground truth but limited scope.
- **Coverage bias?**: Yes — English-centric analysis; asymmetric language pair coverage (many into-English, fewer out-of-English); accent evaluation limited to 7–8 specific varieties per pair; emotion benchmarks contain only 19 professional speakers; religious/cultural representation in long-form audio not discussed.
- **Reproducibility risk?**: Low — standardized prompts, fixed inference settings, public model weights, Hugging Face release planned; some proprietary models (Gemini) create comparison asymmetry; long-form audio inference parameters documented; human annotation guidelines and interface (Permut) open-sourced.

## 8. One-paragraph summary (≤ 120 words, narrative form)

Hearing-to-Translate presents the first large-scale systematic evaluation of speech-to-text translation systems, comparing cascaded architectures (SFM + LLM) against end-to-end SpeechLLMs across 22 systems, 16 benchmarks, 13 language pairs, and 9 linguistic phenomena. Using xCOMET-QE and METRICX-QE metrics, the study finds that cascaded systems remain most reliable overall, but SpeechLLMs show growing potential in certain settings, particularly when speech and language components integrate during pretraining. Robustness to noise, disfluencies, and long-form audio is phenomenon-dependent rather than universally architecture-driven. The work surfaces critical gaps: gender bias and accent variation remain challenging across all paradigms, and computational efficiency trade-offs favor different approaches depending on deployment constraints.

---

## Note completion meta

- Completed by: Claude Code Agent
- Completion date: 2026-06-06
- Confidence (1-5): 4 (comprehensive metadata and evaluation protocol extracted; dataset specification partially estimated from benchmark descriptions; all major claims and findings captured; some fine-grained experimental details in appendices not fully detailed)
- Outstanding questions: Exact total sample count across all 16 benchmarks; specific human evaluation inter-annotator agreement scores; detailed breakdown of gender/accent distribution by language pair (summary provided but granular numbers not all extracted)
