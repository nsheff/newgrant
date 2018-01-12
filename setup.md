# Setup

To build outputs, this follow the instructions at for
[nsheff/mediabuilder](http://github.com/nsheff/mediabuilder).
* [databio/papers](http://github.com/databio/papers) - a bibtex database of citations

## Building grant output

After setting up mediabuilder, you can use `make` to build an output (tab-
complete or see the [Makefile](/Makefile) to view available options).

# Contents

This repository contains:
* [/output/merged.pdf](/output/merged.pdf) - PDF draft of merged (complete) application)
* [/assets](/assets) - Misc documents
* [/src](/src) - Markdown source for the documents
* [/fig](/fig) - `.svg` source for figures
* [/output](/output) - PDFs (or other formats) rendered from `src` by pandoc
* [Makefile](Makefile) - recipes for compiling the PDF outputs from `src`

