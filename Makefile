SHELL := /bin/bash

# no bibliography for this LOI
csl_nobib = ${CODEBASE}mediabuilder/csl/bioinformatics-nobib.csl
#csl = ${CODEBASE}styles/bioinformatics.csl
csl = ${CODEBASE}mediabuilder/csl/compact.csl
csl = ${CODEBASE}mediabuilder/csl/nature.csl
wrapfig = ${CODEBASE}mediabuilder/pandoc-wrapfig/pandoc-wrapfig.py
budgetdir=../budgets/`basename "${PWD}"`
textemplate = ${CODEBASE}mediabuilder/tex_templates/nih.tex
mbin=${CODEBASE}mediabuilder/bin
ifneq ("$(wildcard ${CODEBASE}papers/sheffield.bib)","")
bib = ${CODEBASE}papers/sheffield.bib
else
bib = refs.bib
endif

all: figs abstract aims approach refs merge

text: abstract aims approach refs merge

abstract:
	$(mbin)/nobib `$(mbin)/ver src/abstract` | \
	pandoc \
	-o output/abstract.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--bibliography $(bib) \
	--csl $(csl)

aims:
	$(mbin)/nobib `$(mbin)/ver src/specific_aims` | \
	pandoc \
	-o output/specific_aims.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--bibliography $(bib) \
	--csl $(csl)

approach:
	$(mbin)/nobib `$(mbin)/ver src/specific_aims` \
	`$(mbin)/ver src/significance_innovation` \
	`$(mbin)/ver src/aim1` `$(mbin)/ver src/aim2` `$(mbin)/ver src/aim3` | \
	pandoc \
	-o output/aims_approach.pdf \
	--filter $(wrapfig) \
	--template $(textemplate) \
	--bibliography $(bib) \
	--csl $(csl)

split:
	$(mbin)/splitpdf output/aims_approach.pdf output/approach.pdf

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
	output/approach.pdf \
	output/references.pdf

# supporting docs
supporting:
	pandoc src/authentication_of_resources.md \
	-o output/authentication_of_resources.pdf \
	--template $(textemplate)
	pandoc src/facilities.md \
	-o output/facilities.pdf \
	--template $(textemplate)
	pandoc src/resource_sharing.md \
	-o output/resource_sharing.pdf \
	--template $(textemplate)
	pandoc src/human_subjects.md \
	-o output/human_subjects.pdf \
	--template $(textemplate)
	pandoc src/project_narrative.md \
	-o output/project_narrative.pdf \
	--template $(textemplate)

budget:
	pandoc $(budgetdir)/personnel_justification.md \
	-o $(budgetdir)/personnel_justification.pdf \
	--template $(textemplate)
	pandoc $(budgetdir)/consortium_justification.md \
	-o $(budgetdir)/consortium_justification.pdf \
	--template $(textemplate)