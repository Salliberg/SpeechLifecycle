# Table 3: Speech LLM Benchmark Taxonomy (Two-Axis Framework)

## Section Intro: Organizing the Benchmark Landscape

Classifying 18 speech LLM benchmarks along a single axis (e.g., task family) obscures crucial architectural and methodological distinctions. A speech LLM benchmark can be simultaneously "holistic" (broad-coverage) and "phenomenon-focused" (testing acoustic robustness), or "capability-targeted" and "use-case-grounded." To resolve these cross-cutting categories, we adopt a two-axis framework that separates *depth of scope* from *perspective of evaluation*.

The **Scope axis** captures breadth-vs-depth: narrow probes (SALMon's acoustic consistency) versus capability clusters (AudioBench's 8 tasks) versus deployment-ready suites (Dynamic-SUPERB's 180 tasks) versus scenario-anchored systems (VoiceAgentBench for voice agents). The **Lens axis** captures *what perspective* is prioritized: whether the benchmark measures **model capabilities** (what the model can do), **downstream task completion** (whether the model solves a real job), **linguistic/acoustic phenomena** (robustness to particular signals), or **encoded knowledge** (what the model knows about audio). These axes are orthogonal: a benchmark can probe emotion recognition capability deeply (Targeted Probe × Capability) or evaluate whether a voice agent safely calls the right tool despite accents (Use-case-grounded × Phenomenon).

This matrix exposes three structural gaps with immediate implications for the field:

1. **The empty Use-case × Capability cell**: No benchmark currently asks "Can a model exhibit capability C (e.g., emotion awareness) while completing a downstream job J (e.g., customer support agent)?" Existing use-case benchmarks (VoiceBench, VoiceAgentBench) focus on job completion; existing capability benchmarks (AudioBench, AIR-Bench) measure abilities in isolation. This absence means practitioners cannot yet select a speech LLM for a real-time multilingual emotional assistant based on published benchmark scores.

2. **Sparsity of the Knowledge lens**: Only one benchmark (AKB-2000) systematically probes what auditory and linguistic knowledge the model encodes—despite backbone LLM choice being a first-order design decision for speech LLMs. Most benchmarks treat the LLM as a black box and measure outputs, not representations.

3. **Phenomenon lens coverage is narrow**: Only three domains are tested (multilinguality, acoustic scene, translation). Missing are safety/jailbreak robustness across modalities, latency under real-time constraints, and privacy-preserving inference—all critical for deployment but absent from peer-reviewed benchmarks as of June 2026.

## The 4×4 Matrix

| **Scope ↓ \ Lens →** | **Capability** | **Use-case** | **Phenomenon** | **Knowledge** |
|---|---|---|---|---|
| **Targeted probe** | #07 SALMon, #10 VoxEmo, #11 StyleBench, #06 SD-Eval | — | #14 LoASR-Bench, #16 Hearing2Translate, #18 SCENEBench | #17 AKB-2000 |
| **Capability-focused** | #01 AudioBench, #04 AIR-Bench, #09 FMSU-Bench, #15 SeaLLMs-Audio | — | — | — |
| **Holistic** | #03 Dynamic-SUPERB, #05 MMAU | — | — | — |
| **Use-case-grounded** | — | #02 VoiceBench, #12 VoiceAgentBench, #13 Audio2Tool, #08 SLUE-PERB | — | — |

## Per-Cell Summary

### Targeted Probe × Capability (SALMon, VoxEmo, StyleBench, SD-Eval)
Focus: Narrow, deep evaluation of specific paralinguistic or acoustic-semantic phenomena. SALMon measures acoustic consistency via pairwise preference modeling. VoxEmo standardizes zero-shot emotion recognition with distribution-aware soft-label metrics across 35 corpora and 15 languages. StyleBench probes multi-turn speaking style intensity control (emotion, speed, volume, pitch) on synthetic data. SD-Eval evaluates paralinguistic awareness (emotion, accent, age, environment) in dialogue contexts. Key constraint: All rely on controlled audio; limited architectural/model diversity; dataset releases pending or partial.

### Targeted Probe × Phenomenon (LoASR-Bench, Hearing2Translate, SCENEBench)
Focus: Testing robustness to specific linguistic/acoustic phenomena while measuring performance on a narrow task. LoASR-Bench evaluates low-resource multilingual ASR across 9 language families, exposing script-diversity gaps (non-Latin scripts 1.5–2× higher error). Hearing2Translate systematically tests speech-to-text translation across 9 phenomena (noise, accent, code-switching, disfluency, long-form audio) via 16 benchmarks and 13 language pairs. SCENEBench probes accessibility/industrial use cases: background sound understanding, noise localization, cross-lingual transcription, vocal characterization. Key constraint: Narrow task scope; synthetic-to-real gap; limited language/domain coverage; small human validation sets.

### Targeted Probe × Knowledge (AKB-2000)
Focus: Probing what auditory knowledge LLM backbones encode via text-only pre-training. 2,000 multiple-choice questions across 48 subcategories (speech, sound, music, paralinguistics, phonetics, technical). Finds: Qwen consistently outperforms Llama by >10 points; text-only auditory knowledge correlates with multimodal audio performance (r=0.71–0.82); systematic failure on phonological tasks due to text-only limitation. Key constraint: Proprietary models involved in curation saturate at 94–96% (upper bound not unbiased); cascade bottleneck is audio encoder, not LLM backbone; single benchmark in Knowledge lens (sparse).

### Capability-Focused × Capability (AudioBench, AIR-Bench, FMSU-Bench, SeaLLMs-Audio)
Focus: Measuring model abilities across multiple tasks under controlled conditions. AudioBench (100k+ samples, 8 tasks): unified framework for ASR, SQA, emotion, accent, speaker, scene understanding. AIR-Bench (19k+ samples, 19 tasks): generative comprehension with position-swap bias mitigation for GPT-4 judge. FMSU-Bench (20k+ samples, 14 dimensions): fine-grained paralinguistic perception; bilingual (Chinese/English); manually verified. SeaLLMs-Audio (1.58M training, 580 test questions): regional multilingual benchmark for Southeast Asia with 0.8 Pearson human-LLM correlation. Key constraint: No standardized metrics across benchmarks; data sourcing varies (synthetic, movie audio, regional speech); English-dominant or limited language coverage; model coverage fragmented.

### Holistic × Capability (Dynamic-SUPERB, MMAU)
Focus: Broadest coverage of audio understanding across multiple tasks and modalities. Dynamic-SUPERB Phase-2 (180 tasks, 80+ datasets): largest universal instruction-based benchmark spanning speech, music, audio; LLM-as-judge with constrained output; multimodal evaluation. MMAU (10,000 QA pairs, 27 skills): expert-level audio reasoning combining perception and domain knowledge across speech, sound, music. Key constraint: GPT-4o evaluation proprietary/unpredictable (Dynamic-SUPERB); multiple-choice only (MMAU); neither jointly evaluates use-case constraints, phenomena robustness, or knowledge encoding; inherent trade-off between breadth and measurement depth.

### Use-case-grounded × Use-case (VoiceBench, VoiceAgentBench, Audio2Tool, SLUE-PERB)
Focus: Evaluating downstream task completion in realistic scenarios. VoiceBench (3,074 samples, 8 tasks): end-to-end voice assistant evaluation including instruction-following, QA, robustness (speaker variations, noise), safety. VoiceAgentBench (6,134 queries, 6 tasks, 7 languages): agentic tool-use from speech across single calls → multi-turn dialogue, multilingual; contrasts SpeechLMs vs. ASR-LLM cascades. Audio2Tool (30,000 queries, 8 tiers, 3 domains): speech-to-tool reasoning with compositional complexity; measures tool accuracy, exact match, parameter F1 across IoT scenarios. SLUE-PERB (22,236 utterances, 4 tasks): classical SLU tasks (dialogue acts, QA, summarization, NER) on conversational/discourse speech. Key constraint: Task fragmentation; no shared evaluation protocol; synthetic audio dominance; limited proprietary model coverage; SLUE-PERB lacks human baseline.

---

## Cross-Cell Observations

### Empty Cells: Strategic Gaps

**Use-case × Capability (completely empty)**: Most consequential gap. Practitioners cannot ask: "Which model best balances tool-call accuracy with emotional awareness?" No benchmark simultaneously measures whether a model maintains code-switching fidelity while invoking tools, or whether style control degrades under realistic call-center noise. Filling this cell is the primary benchmark research priority.

**Capability-focused × Phenomenon (empty)**: No benchmark measures how robustness to a phenomenon (code-switching, noise, accents) varies across related capabilities (paralinguistics: emotion, style, speaker traits). LoASR-Bench tests multilinguality but only measures ASR; Hearing2Translate tests translation robustness but only measures translation performance.

**Holistic × Phenomenon, Use-case, Knowledge (all empty)**: No holistic benchmark simultaneously captures phenomenon-robustness, use-case grounding, or knowledge encoding. This reflects design trade-offs: holistic benchmarks prioritize breadth over depth within any single perspective.

### Crowded Cells: Saturation and Fragmentation

**Capability-focused × Capability (4 benchmarks)**: Densest cell, reflecting field maturity in measuring multi-task abilities. However, fragmentation problem: no two benchmarks use identical datasets, task definitions, or metrics. AudioBench (26 datasets), AIR-Bench (13 audio sources), FMSU-Bench (movies/TV), SeaLLMs-Audio (regional speech) each claim comprehensiveness within a scope but no subsumption. Field would benefit from consolidation: unified "Capability Baseline Suite" with standardized metrics across real/synthetic audio, multilingual splits, and classical NLP benchmarks.

**Targeted Probe × Capability (4 benchmarks)**: All target paralinguistics/acoustic-semantics published 2024–2026 (research trend). Each addresses different phenomena (SALMon: acoustic consistency; VoxEmo: emotion distribution-aware; StyleBench: multi-turn style intensity; SD-Eval: dialogue-aware paralinguistics). Little overlap; all necessary.

**Use-case-grounded × Use-case (4 benchmarks)**: Divergent use-cases (voice assistants, agents, tools, classical SLU). SLUE-PERB most established (peer-reviewed, 2023) but classical SLU tasks only. VoiceAgentBench most comprehensive in multilingual/agentic scope but preprint. Audio2Tool uniquely emphasizes compositional reasoning but IoT-narrow. VoiceBench covers instruction-following + robustness but lightweight. No unified "Voice Assistant Evaluation Suite" exists combining all four.

**Targeted Probe × Knowledge (1 benchmark, sparse)**: AKB-2000 only Knowledge-lens benchmark despite backbone LLM choice being first-order design decision. Future work must expand: Knowledge-probing for other LLM families (ELECTRA, RoBERTa, DeBERTa), modalities (music, sound), cross-lingual concepts.

### Reproducibility and Validity Patterns

**LLM-as-judge shift (2024–2026)**: Early benchmarks (SLUE-PERB 2023) use classical NLP metrics (F1, ROUGE). Recent benchmarks (#01, #04, #05, #09, #10, #15, #16, #17) employ LLM judges. Reflects generative-model era but introduces moderate judge reliability (Pearson 0.6–0.8) and undocumented cross-benchmark judge drift—key validity threat.

**Distribution-aware metrics emerging (VoxEmo 2026)**: Recognizes subjective tasks (emotion, style) inherently exhibit annotation disagreement. Introduces soft-label evaluation (KLD, JSD, TVD on annotator distributions) as alternative to hard-label accuracy. Methodological advancement that should influence future paralinguistic benchmarks.

**Synthetic-real validation gap**: All benchmarks acknowledge synthetic-real gap but **no benchmark systematically reports correlation between synthetic and real evaluation at scale**. SD-Eval and Hearing2Translate conduct partial cross-validation; comprehensive benchmarking remains absent.

**Model coverage bias**: No benchmark systematically evaluates all 8–10 major speech LLMs (Qwen-Audio, Audio-Flamingo, SALMONN, Moshi, GLM-4-Voice, Kimi-Audio, OmniCaptioner, Phi-4-Multimodal, MiniCPM-o, GPT-4o-Audio). Open-weight benchmarks (#11, #14) cannot evaluate proprietary flagships; benchmarks using proprietary judges introduce drift risk.

---

## Design Principles for Future Benchmarks

1. **Select benchmarks orthogonally**: Combine use-case benchmarks (VoiceAgentBench/Audio2Tool for job completion) with capability benchmarks (FMSU-Bench for fine-grained paralinguistics) and phenomenon probes (Hearing2Translate for robustness). No single benchmark is sufficient.

2. **Prioritize Use-case × Capability cell**: Pair FMSU-Bench's 14-dimensional capability assessment with VoiceAgentBench's tool-use and multi-turn dynamics under realistic noise/latency. This "Real-World Voice Assistant Challenge" would directly serve practitioners.

3. **Consolidate evaluation infrastructure**: Propose unified "Speech LLM Evaluation Card" format (capabilities measured, models evaluated, judge/metric used, validity threats unaddressed) to enable reproducible cross-benchmark comparison and accelerate field progress.
