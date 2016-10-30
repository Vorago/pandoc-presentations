# Synopsis
This is a tool to batch convert markdown files into presentations focused on easy setup process.

It uses [Docker](https://www.docker.com/) for running [Pandoc](http://pandoc.org/) conversion from .md into [reveal.js](https://github.com/hakimel/reveal.js/) presentation

# Usage

~~~{.sh}
cd pandoc-presentations
python convert.py <absolute-path-to-directory-with-my-slides>
~~~

# Sample

~~~{.sh}
cd pandoc-presentations
python convert.py `pwd`/sample
~~~

The result can be seen in pandoc-presentations/sample/result/01.html
