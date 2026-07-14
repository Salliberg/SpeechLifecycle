# [#12] VoiceAgentBench: Are Voice Assistants Ready for Agentic Tasks?

---

## 0. Bibliographic metadata

- **Title**: VoiceAgentBench: Are Voice Assistants Ready for Agentic Tasks?
- **Authors**: Dhruv Jain, Harshit Shukla, Gautam Rajeev, Ashish Kulkarni, Chandra Khatri, Shubham Agarwal
- **Year**: 2026
- **Venue**: arXiv (preprint)
- **arXiv ID**: 2510.07928v3
- **Peer-reviewed?**: no
- **Project page or code link**: https://huggingface.co/datasets/krutrim-ai-labs/VoiceAgentBench; https://github.com/ola-krutrim/VoiceAgentBench
- **Date of latest version read**: February 13, 2026

## 1. Motivation (≤ 5 lines)

Speech Language Models (SpeechLMs) enable direct spoken interaction, avoiding ASR-LLM pipeline latency. However, existing speech benchmarks focus on isolated capabilities like transcription or question answering and do not systematically evaluate agentic behavior. This work addresses the gap by introducing a comprehensive benchmark for evaluating SpeechLMs in realistic tool-use scenarios spanning single/multi-tool invocations, sequential workflows, multi-turn dialogue, and safety evaluations across English and six Indic languages.

## 2. Capability coverage checklist (machine-parsed for Figure 3)

- [ ] **ASR / transcription**
- [ ] **Speech QA / understanding**
- [ ] **Paralinguistics — emotion**
- [ ] **Paralinguistics — accent / dialect**
- [ ] **Paralinguistics — speaker traits**
- [ ] **Paralinguistics — style / prosody**
- [x] **Multi-turn dialogue / interaction**
- [x] **Multilinguality / cross-lingual**
- [ ] **Latency / streaming evaluation**
- [ ] **Robustness — noise / acoustic perturbation**
- [ ] **Robustness — distribution shift / OOD**
- [x] **Safety / jailbreak resistance**
- [ ] **Privacy / speaker anonymity**
- [x] **Tool use / agentic action**
- [ ] **Audio environment / scene understanding**
- [ ] **Speech generation quality**
- [ ] **Code-switching**

## 3. Dataset specification

| Field | Value |
|---|---|
| Total samples | 6,134 spoken queries |
| Number of tasks | 6 task categories (Single Tool Call, Single Tool with Retrieval, Parallel Tool Calling, Sequential Dependent Tool Calling, Multi-Turn Dialogue Tool Calling, Safety Evaluations) |
| Number of datasets / sub-benchmarks | 2 (English subset, Multilingual subset with 6 Indic languages) |
| Languages covered | English, Hindi, Bengali, Marathi, Tamil, Telugu, Malayalam |
| Audio source (real / synthetic / mixed) | Synthetic (Text-to-Speech with diversity sampling) |
| Speaker diversity (count, demographics) | NOT STATED (speaker diversity achieved through embedding-based sampling strategy maximizing acoustic diversity across accents, speaking styles, and vocal characteristics; uses ECAPA-TDNN embeddings) |
| Audio length distribution | English: avg 4.50s, Multilingual: avg 6.50s (overall range varies by task from ~3–20s) |
| Open data? | yes |

## 4. Evaluation protocol

- **Metric type**: Four core metrics — Tool Selection (TS), Tool Call Structure (TCS), Parameter Filling (PF), and Refusal Rate (RR). TS uses regex-based validation; TCS validates against Pydantic schema; PF uses GPT-4o-mini as judge with human agreement validation; RR uses semantic judgment via GPT-4o-mini.
- **Scoring details**: TS and TCS are exact-match; PF accounts for semantic variation using human-validated faithfulness assessment; RR evaluates refusal of harmful/unsafe requests. Appendix H reports Cohen's Kappa for inter-rater agreement.
- **Models evaluated in the paper**: SpeechLMs: KimiAudio 7B, Owen2.5-Omni, Audio-Flamingo3 7B. ASR-LLM pipelines: Qwen3 8B, Gemma3 27B, LLaMA 3.3 70B (with Whisper v3 Large for ASR).
- **Reproducibility**: Task-wise instructions provided; models evaluated in one-shot setting; refusal prompt specified in Appendix M.1; extensive ablations (ASR error impact, zero-shot vs. one-shot) in Appendix D.

## 5. Reported limitations

- L1: Evaluation does not consider speech with background noise, thus does not measure noise robustness on tool invocation.
- L2: Multi-turn dialogues not evaluated for some Indic languages due to cost constraints; evaluation excludes closed-source assistants such as GPT-4o-audio and Gemini-2.5-Pro.
- L3: Does not study dynamic and real-time tool invocation with interactive user conversations; focus is on static query-response evaluation rather than continuous dialogue loops.

## 6. How this fits into our IPM survey §5

- **Benchmark family**: agentic
- **Goes into Table 3 row**: VoiceAgentBench (Jain et al., 2026)
- **Goes into Figure 3 heatmap cells**: Multi-turn dialogue, Multilinguality, Safety, Tool use / agentic action
- **Tier**: Tier 1 (comprehensive, multimodal agentic benchmark with 6K+ queries, multilingual coverage, publicly available)
- **Specific claim it supports**: SpeechLMs lag behind ASR-LLM cascades on complex agentic tasks; significant multilingual generalization gap; sequential and dependent tool calling remains most challenging.
- **Gap it surfaces**: Limited multilingual supervision and culturally grounded training; SpeechLMs underperform on complex multi-step reasoning; safety behavior inconsistent across languages.

## 7. Risk / red flags

- **Preprint with unverified claims?** Partial risk. Paper is preprint (arXiv 2510.07928v3) but includes human validation study (Appendix G) with reported inter-rater agreement, mitigating some concerns. Claims appear supported by ablation studies (ASR impact, one-shot vs. zero-shot).
- **Inflated SoTA / cherry-picked baselines?** Low risk. Evaluation includes both end-to-end SpeechLMs and ASR-LLM cascades; compares multiple Whisper-based LLM variants (v3-Qwen3, v3-Gemma, v3-Llama) showing consistent patterns rather than single best model.
- **LLM-as-judge reliability issues?** Moderate risk. Uses GPT-4o-mini for Parameter Filling (PF) and Refusal Rate (RR) scoring. Appendix H reports human agreement validation, but GPT-4o-mini used for judgment without detailed inter-annotator study on all dimensions. TS and TCS are exact-match, reducing judge bias for these metrics.
- **Coverage bias?** Moderate risk. All queries are synthetically generated via TTS; limited real noisy speech and acoustic variability beyond speaker embeddings. Diversity sampling is principled (Furthest Point Sampling) but operates in embedding space; may not capture all real-world acoustic variation.
- **Reproducibility risk?** Low risk. Authors commit to public release on HuggingFace and GitHub; extensive documentation in appendices; experimental configurations logged; human validation procedure detailed (Appendix G).

## 8. One-paragraph summary (≤ 120 words, narrative form)

VoiceAgentBench is a large-scale benchmark comprising 6,134 synthetic spoken queries across English and six Indic languages, designed to evaluate SpeechLMs on agentic tool-use capabilities. The benchmark spans six task categories: single tool invocation, tool retrieval, parallel calls, sequential dependencies, multi-turn dialogue, and safety evaluations. Evaluation uses four metrics—Tool Selection, Tool Call Structure, Parameter Filling, and Refusal Rate—capturing structural correctness, semantic faithfulness, and safety. Results reveal that ASR-LLM pipelines consistently outperform end-to-end SpeechLMs, with the largest gap in complex sequential and dialogue-based tasks. Significant multilingual degradation and inconsistent safety behavior across languages highlight the need for richer multilingual supervision and culturally grounded training for voice agents.

---

## Note completion meta

- Completed by: Claude Code
- Completion date: 2026-06-06
- Confidence (1-5): 4
- Outstanding questions: Exact number of speaker identities used in TTS generation not explicitly stated; specific details on how GPT-4o-mini inter-rater agreement was computed (which annotators, sample size) could be clearer in main text.
