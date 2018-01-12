# Grant template

Fork this repository to write a new markdown grant.

This repository contains `markdown` source documents rendered with
[mediabuilder](https://github.com/nsheff/mediabuilder) and
[pandoc](https://pandoc.org/). See [setup.md](/setup.md) for instructions.

# Contents

This repository contains:
* [/output/merged.pdf](/output/merged.pdf) - PDF draft of merged (complete) application)
* [/assets](/assets) - Misc documents  
* [/src](/src) - Markdown source for the documents
* [/fig](/fig) - `.svg` source for figures
* [/output](/output) - PDFs (or other formats) rendered from `src` by pandoc
* [Makefile](Makefile) - recipes for compiling the PDF outputs from `src`

## Building grant output

Run `make` to build an output (tab-complete or see the [Makefile](/Makefile) to view
available options). See [setup.md](/setup.md) for more details.
