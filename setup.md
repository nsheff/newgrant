
## Setup

To build outputs, this repo requires:

* [pandoc](https://pandoc.org/) to convert from source
* [nsheff/mediabuilder](http://github.com/nsheff/mediabuilder) for PDF templates
* [nsheff/pandoc-wrapfig](http://github.com/nsheff/pandoc-wrapfig) to wrap figures concisely in PDFs
* [databio/papers](http://github.com/databio/papers) - a bibtex database of citations
* [citation-style-language/styles](https://github.com/citation-style-language/styles) - optional, for additional styles

Set an environment variable `$CODEBASE` to where you will store the above git
repositories

```
export CODEBASE=`pwd`/
git clone git@github.com:nsheff/mediabuilder.git
git clone git@github.com:nsheff/pandoc-wrapfig.git
```