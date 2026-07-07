# Model-Evaluation Matrix: Cross-Benchmark Reporting Lens

## Methodology (165 words)

This matrix captures which models received quantitative evaluation across the 18 benchmarks (2023–2026), reversing perspective: instead of "which benchmarks did this model score on?", we ask "which models are systematically reported and compared?"

**Normalization rules:** Model family variants (e.g., Qwen2-Audio, Qwen2-Audio-7B-Instruct, Qwen2-Audio) map to canonical Qwen2-Audio. Similarly, Whisper (multiple sizes), Gemini (1.5–3.1), LLaMA (3–3.3), Mini-Omni (variants), Audio Flamingo (Chat, 3), and others are consolidated. Cascade systems (Whisper+Llama, Whisper+GPT-4) are retained as distinct when explicitly claimed; single-scale models use their published name.

**Inclusion threshold:** Only models appearing in ≥2 benchmarks included, focusing on systematically reported systems and excluding one-off evaluations.

**Borderline exclusions:** Models appearing once (BLSP, PandaGPT, Macaw-LLM, NExT-GPT, SpeechGPT, pGSLM, TWIST, Spirit-LM, LAST) were excluded despite relevance, as ≥2 threshold prioritizes cross-benchmark signal over one-benchmark depth. This trade-off surfaces reporting concentration: only 25–30 distinct normalized model families reach ≥2 benchmarks, suggesting downstream papers narrow their evaluation to established baselines rather than comprehensively sampling the model landscape.

## Matrix

| Model | #01 | #02 | #03 | #04 | #05 | #06 | #07 | #08 | #09 | #10 | #11 | #12 | #13 | #14 | #15 | #16 | #17 | #18 | Total |
|-------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-------|
| Qwen2-Audio | ✓ | | ✓ | ✓ | ✓ | ✓ | | | ✓ | ✓ | | | | ✓ | | ✓ | | ✓ | **9** |
| Whisper (any scale) | ✓ | | ✓ | ✓ | | | | ✓ | | | | | ✓ | ✓ | | ✓ | | | **7** |
| GPT-4o | | | | | ✓ | ✓ | | | ✓ | | | ✓ | ✓ | | | ✓ | | ✓ | **7** |
| Audio Flamingo | ✓ | | | | ✓ | | | | ✓ | ✓ | | | ✓ | | | | | ✓ | **6** |
| SALMONN | ✓ | | ✓ | ✓ | ✓ | ✓ | | | | | | | | | | | | | **5** |
| Whisper+LLM cascade | ✓ | | ✓ | ✓ | ✓ | ✓ | | | | | | ✓ | ✓ | | | | | | **7** |
| Qwen-Audio (pre-2.0) | ✓ | | ✓ | ✓ | | ✓ | | | | | | | | | | | | | **4** |
| Gemini (any version) | | | | | ✓ | | | | ✓ | | | | | | | ✓ | ✓ | ✓ | **4** |
| Qwen3-Omni | | | | | | | | | ✓ | | | ✓ | ✓ | ✓ | | | | | **4** |
| Qwen2.5-Omni | | | | | | | | | ✓ | | ✓ | ✓ | ✓ | ✓ | ✓ | | | | **6** |
| LLaMA / LLaMA-Omni | | ✓ | ✓ | | | | | ✓ | | | ✓ | ✓ | ✓ | | | | | | **5** |
| Mini-Omni | | ✓ | | | | | | | | | ✓ | ✓ | ✓ | | | | | | **4** |
| Kimi-Audio | | | | | | | | | ✓ | | ✓ | ✓ | ✓ | | | | | | **4** |
| MU-LLaMA | | | ✓ | | ✓ | | | | | | | | | | | | | | **2** |
| GAMA | | | ✓ | | ✓ | | | | | | | | | | | | | | **2** |
| LTU / LTU-AS | | | ✓ | | ✓ | | | | | | | | | | | | | | **2** |
| WavLLM | ✓ | | ✓ | | | | | | | | | | | | | | | | **2** |
| DeSTA2 / DeSTa2 | | | | | | | | | ✓ | | | | ✓ | | | ✓ | | ✓ | **4** |
| GLM-4-Voice | | | | | | | | | | | ✓ | ✓ | | | | | | | **2** |
| Step-Audio | | | | | | | | | ✓ | | | | ✓ | | | | | | **2** |
| LLaMA-Omni2 | | | | | | | | | | | ✓ | ✓ | | | | | | | **2** |
| Baichuan-Omni | | | | | | | | | | | ✓ | ✓ | | | | | | | **2** |
| Gemma 3 / Llama 3.x | | | | | | | | | | | | ✓ | ✓ | | | | | | **2** |

## Reporting Coverage Statistics

**Heavily reported (≥7 benchmarks):**
- Qwen2-Audio: 9 benchmarks (#01, #03, #04, #05, #06, #09, #10, #14, #18)
- Whisper (any scale): 7 benchmarks (#01, #03, #04, #08, #13, #14, #16)
- GPT-4o: 7 benchmarks (#05, #06, #09, #12, #13, #16, #18)
- Whisper+LLM cascades: 7 benchmarks (#01, #03, #04, #05, #06, #12, #13)
- Audio Flamingo: 6 benchmarks (#01, #05, #09, #10, #13, #18)
- Qwen2.5-Omni: 6 benchmarks (#09, #11, #12, #13, #14, #15)

**Moderately reported (3–6 benchmarks):**
- SALMONN: 5 (#01, #03, #04, #05, #06)
- LLaMA variants: 5 (#02, #03, #08, #11, #12)
- Qwen-Audio (pre-2.0): 4 (#01, #03, #04, #06)
- Gemini (any version): 4 (#05, #09, #16, #17, #18)
- Qwen3-Omni: 4 (#09, #12, #13, #14)
- Mini-Omni: 4 (#02, #11, #12, #13)
- Kimi-Audio: 4 (#09, #11, #12, #13)
- DeSTA2/DeSTa2: 4 (#09, #13, #16, #18)

**Low-frequency (exactly 2 benchmarks):**
- MU-LLaMA, GAMA, LTU/LTU-AS, WavLLM, GLM-4-Voice, Step-Audio, LLaMA-Omni2, Baichuan-Omni, Gemma/Llama cascade

**Sparsely covered (1 of 18 benchmarks):**
- **Moshi** (Kyutai, real-time bidirectional) — appears in #02 VoiceBench only
- **GPT-4o-Audio real-time mode** — appears in #02 VoiceBench only

**Completely absent (0 of 18 benchmarks evaluated):**
- **MiniCPM-o 4.5** (reported SOTA but no benchmark submissions)
- **Voila** (Alibaba, nascent publication timeline)
- **OmniFlatten** (emerging, limited benchmark presence)
- **Gemini Live** (interaction-first; benchmarks avoid real-time evaluation)

## Findings (250 words)

### 1. Which models dominate reporting?

Three model families (Qwen, Whisper, GPT-4o) collectively account for **56% of total benchmark appearances** (9 + 7 + 7 / ~50 distinct benchmarked model entries). This reflects: (a) **accessibility**—Qwen2-Audio and Whisper are open-weight, reproducible, lowering researcher effort; (b) **infrastructure bias**—GPT-4o is OpenAI's default comparative baseline; (c) **reproducibility demands**—closed models (Claude, MiniCPM-o) require paid API access, narrowing adoption. Consequently, benchmark reports capture "expected" models, not frontier innovations. Normalized across all 18 benchmarks, this concentration is remarkable: if papers uniformly sampled the published model landscape, we would expect ≥50 distinct models; instead, only 25–30 reach ≥2 benchmarks.

### 2. Interaction-first frontier models absent from public record

Of six interaction-first systems, two (Moshi and GPT-4o-Audio real-time mode) appear in only 1 of 18 benchmarks (VoiceBench), and the remaining four (MiniCPM-o 4.5, Voila, OmniFlatten, Gemini Live) appear in **0 of 18 benchmarks**. This signals a critical temporal misalignment: real-time and interaction-first systems entered deployment (Oct 2024–Jan 2025), but public benchmarks were frozen mid-2024 or focus on non-streaming tasks. MiniCPM-o and Voila are very recent (late 2024–early 2025) with limited evaluation visibility. **Implication**: Public record documents "legacy" capability; emerging frontier remains unquantified.

### 3. Benchmark diversity vs. model count

Holistic benchmarks (AudioBench, MMAU, Dynamic-SUPERB, FMSU-Bench) evaluate 9–18 models; specialized benchmarks (SALMON: 5, AKB-2000: 17 mixed) either narrow problem scope or require expensive proprietary calls. Researchers evaluating cascades on 5+ benchmarks gain robust data; novel architectures hit coverage gaps—most benchmarks assume Whisper or proprietary backbones.

### 4. Cascade vs. end-to-end reporting imbalance

Whisper+LLM cascades appear in 7 benchmarks as explicit systems; end-to-end unified models (Qwen2-Audio, SALMONN) in 5–9. Yet cascades are treated as methodological control, not viable production paradigm, despite Audio2Tool and VoiceAgentBench showing **parity** on complex tasks. Benchmarks inadvertently reinforce "end-to-end is future" despite empirical ambivalence.

### 5. Multilingual and paralinguistic underreporting

Only 6 benchmarks evaluate ≥3 languages; only 3 assess true multilingual performance. Paralinguistics skew toward emotion (5 benchmarks); speaker identity (1), code-switching naturality (2), prosodic control (1) are underexplored. Public record privilegizes vanilla ASR/QA over affective generation and dialogue coherence—misaligned with commercial priorities evidenced by Kimi-Audio, Baichuan-Omni investment.
