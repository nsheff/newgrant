# Contents

This repository [separates content from
style](http://databio.org/posts/markdown_style.html) by authoring all documents
in `markdown` format. It uses a series of tools to render those documents in the
desired output style. It relies on [pandoc](https://pandoc.org/) for conversion,
[pandoc-citeproc](https://github.com/jgm/pandoc-citeproc) to manage citations,
and [nsheff/mediabuilder](http://github.com/nsheff/mediabuilder) for various
templates and styles.

This repository contains:
* [/assets](/assets) - Misc external built documents (*e.g.* PDFs)
* [/src](/src) - Markdown source for the documents
* [/fig](/fig) - `.svg` source for figures
* [/output](/output) - PDFs (or other formats) rendered from `src` by pandoc
* [Makefile](Makefile) - recipes for compiling the PDF outputs from `src`

# Instructions

If you're only interested in viewing the grant (not editing it), just view the
built versions in the [/output](/output) folder.

To build outputs, follow the setup instructions at
[nsheff/mediabuilder](http://github.com/nsheff/mediabuilder). After setting up
mediabuilder, you can use `make` to build an output (tab-complete or see the
[Makefile](/Makefile) to view available options).

