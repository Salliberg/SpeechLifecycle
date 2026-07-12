# IP&M / Elsevier CAS conversion package

Generated from the original IEEE-style project.

## Main files
- `main_els_anonymous.tex`: anonymized Elsevier CAS manuscript for double-anonymous review.
- `title_page_els.tex`: separate non-anonymous title page with authors, affiliations, CRediT, funding, and competing-interest placeholders.

## Compile
```bash
pdflatex main_els_anonymous
bibtex main_els_anonymous
pdflatex main_els_anonymous
pdflatex main_els_anonymous

pdflatex title_page_els
pdflatex title_page_els
```

## Supplementary reconciliation notes
- `supplementary/ModelEvalMatrix.md`: reconciled the check-grid against the Totals column (2026-07). Removed two stray checkmarks whose IDs were unambiguously identifiable from the prose enumeration under "Reporting Coverage Statistics": Qwen2-Audio (dropped #16; the prose lists #01,#03,#04,#05,#06,#09,#10,#14,#18) and LLaMA/LLaMA-Omni (dropped #13; prose lists #02,#03,#08,#11,#12). **Still to reconcile by original coder:** the Gemini row shows 5 grid checkmarks (#05,#09,#16,#17,#18) but a stated Total of 4, and the prose enumeration also lists all five IDs while labeling the count "4". The manuscript (SECTION4 ~l.462) likewise asserts "Gemini = 4". Because the extra entry is a stray *benchmark ID* rather than an isolated checkmark, it cannot be corrected without the original coding notes — the coder must confirm which of the five Gemini appearances is spurious (or whether the count should be 5).

## Before submission
- Verify whether IP&M wants single-column `cas-sc` or double-column `cas-dc` for LaTeX submissions.
- Confirm CRediT roles and corresponding author with all coauthors.
- Replace TODO placeholders on the title page.
- Check that supplement files are also anonymized.
- Search final source/PDF metadata for author names before uploading.
