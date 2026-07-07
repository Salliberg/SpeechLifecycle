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

## Before submission
- Verify whether IP&M wants single-column `cas-sc` or double-column `cas-dc` for LaTeX submissions.
- Confirm CRediT roles and corresponding author with all coauthors.
- Replace TODO placeholders on the title page.
- Check that supplement files are also anonymized.
- Search final source/PDF metadata for author names before uploading.
