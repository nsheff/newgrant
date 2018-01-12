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

aims:
	pandoc `$(mbin)/ver src/specific_aims` \
	-o output/specific_aims.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--csl $(csl)

approach:
	pandoc `$(mbin)/ver src/significance_innovation` \
	`$(mbin)/ver src/aim1` `$(mbin)/ver src/aim2` `$(mbin)/ver src/aim3` \
	-o output/approach.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--bibliography grant.bib \
	--csl $(csl)

refs:
	$(mbin)/getrefs `$(mbin)/ver src/research_proposal` | \
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
	output/title_page.pdf \
	output/research_proposal.pdf \
	output/assembly_plan.pdf

