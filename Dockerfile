FROM haskell:7.10

RUN cabal update && cabal install pandoc-1.15.1.1

# install latex packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig

WORKDIR /vagrant

ENTRYPOINT ["/root/.cabal/bin/pandoc"]
