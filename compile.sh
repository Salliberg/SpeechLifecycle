#!/usr/bin/env bash
set -e
pdflatex -interaction=nonstopmode main_els_anonymous.tex
bibtex main_els_anonymous || bibtex.original main_els_anonymous
pdflatex -interaction=nonstopmode main_els_anonymous.tex
pdflatex -interaction=nonstopmode main_els_anonymous.tex
pdflatex -interaction=nonstopmode title_page_els.tex
pdflatex -interaction=nonstopmode title_page_els.tex
