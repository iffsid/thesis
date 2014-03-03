SHELL := /bin/bash

all: thesis.pdf

clean:
	find . -type f -regextype posix-egrep -regex .*\.\(aux\|bbl\|blg\|lof\|log\|lot\|toc\|dvi\) -delete

real-clean:
	make clean
	rm -f thesis.pdf

.SECONDEXPANSION:

thesis.pdf: thesis.tex thesis.bib
	make clean
	pdflatex thesis
	bibtex thesis
	pdflatex thesis
	pdflatex thesis
	pdflatex thesis
	make clean
	pdftk form-9.pdf thesis.pdf cat output siddharth-thesis.pdf

.PHONY: clean
