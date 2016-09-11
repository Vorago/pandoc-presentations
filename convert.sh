#!/bin/sh

export REVEALJS_URL="https://cdn.jsdelivr.net/reveal.js/3.0.0"
export TRANSITION="fade"
export THEME="serif"

if [ ! -d "$1" ]; then
  echo "Directory with .md files is expected as an argument"
  exit 1
fi

if [ ! -d "tmp" ]; then
  mkdir tmp
fi

cp $1/* tmp/

find tmp -name \*.md -type f -exec \
  sh -c 'docker run --name pandoc --rm=true -v $(pwd):/vagrant \
  pandoc -o tmp/$(basename {} ".md").html -s \
  -V theme=$THEME \
  --no-highlight \
  --template=template.html \
  -V transition=$TRANSITION \
  -V revealjs-url=$REVEALJS_URL \
  --self-contained \
  -t revealjs {}' \;

if [ ! -d "$1/slides" ]; then
  mkdir $1/slides
fi
find tmp/ -name \*.html -exec cp {} $1/slides \;

rm -rf tmp

echo ""
echo "Converted slides can be found at $1/slides"
