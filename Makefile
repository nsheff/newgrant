SHELL := /bin/bash

# no bibliography for this LOI
csl_nobib = ${CODEBASE}mediabuilder/csl/bioinformatics-nobib.csl
#csl = ${CODEBASE}styles/bioinformatics.csl
csl = ${CODEBASE}mediabuilder/csl/compact.csl
csl = ${CODEBASE}mediabuilder/csl/nature.csl
wrapfig = ${CODEBASE}mediabuilder/pandoc-wrapfig/pandoc-wrapfig.py
textemplate = ${CODEBASE}mediabuilder/tex_templates/nih.tex
mbin=${CODEBASE}mediabuilder/bin
ifneq ("$(wildcard ${CODEBASE}papers/sheffield.bib)","")
bib = ${CODEBASE}papers/sheffield.bib
else
bib = refs.bib
endif

all: figs aims approach refs merge

aims:
	$(mbin)/nobib `$(mbin)/ver src/specific_aims` | \
	pandoc \
	-o output/specific_aims.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--bibliography $(bib) \
	--csl $(csl)

approach:
	$(mbin)/nobib `$(mbin)/ver src/significance_innovation` \
	`$(mbin)/ver src/aim1` `$(mbin)/ver src/aim2` `$(mbin)/ver src/aim3` | \
	pandoc \
	-o output/approach.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--bibliography $(bib) \
	--csl $(csl)

refs:
	$(mbin)/getrefs `$(mbin)/ver src/specific_aims` \
	`$(mbin)/ver src/significance_innovation` \
	`$(mbin)/ver src/aim1` `$(mbin)/ver src/aim2` `$(mbin)/ver src/aim3` | \
	pandoc \
	-o output/references.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--bibliography $(bib) \
	--csl $(csl)
	 
figs:
	$(mbin)/buildfigs fig/*.svg

merge:
	$(mbin)/mergepdf output/merged.pdf \
	output/specific_aims.pdf \
	output/approach.pdf \
	output/references.pdf

