#: title  : templex/xelatex-ngerman2
#: author : "Fabian Tolkmitt" <ftolkmitt@gmail.com>
#: version: "1.0.0"
# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:<VERSION>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
# Install all TeX and LaTeX dependences
RUN apt-get install  --yes --no-install-recommends software-properties-common && \
  add-apt-repository ppa:texlive-backports/ppa && \
  apt-get update && \
  apt-get install --yes --no-install-recommends \
  fontconfig \
  git \
  ca-certificates \
  inotify-tools \
  lmodern \
  make \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-lang-portuguese \
  texlive-xetex \
  texlive-lang-german && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
