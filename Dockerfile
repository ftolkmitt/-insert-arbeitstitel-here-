#: title  : templex/xelatex-ngerman2
#: author : "Fabian Tolkmitt" <ftolkmitt@gmail.com>
#: version: "1.0.0"
FROM moss/xelatex:latest
MAINTAINER ftolkmitt@gmail.com

LABEL version="1.0.0"

ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependences
RUN add-apt-repository ppa:texlive-backports/ppa && \\
  apt-get update && \
  apt-get install --yes --no-install-recommends \
  fontconfig
  texlive-lang-german && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Export the output data
WORKDIR /data
VOLUME ["/data"]
