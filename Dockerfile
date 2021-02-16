FROM ruby:2.6-slim-buster

# Locales
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8

# Better terminal support
ENV TERM screen-256color
ENV DEBIAN_FRONTEND noninteractive

# node
ENV NODE_MAJOR 12

# yarn
ENV YARN_VERSION 1.22.5

# Common packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  curl \
  ctags \
  fzf \
  libevent-dev \
	locales \
  python3-dev \
  python3-pip \
  rubygems \
  tidy \
  tzdata \
  zsh \
  git  \
  software-properties-common \
  ninja-build \
  gettext \
  libtool \
  libtool-bin \
  autoconf \
  automake \
  cmake \
  g++ \
  pkg-config \
  unzip \ 
  silversearcher-ag && \
	locale-gen en_US.UTF-8 && \
	chsh -s /usr/bin/zsh && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# build neovim
RUN git clone https://github.com/neovim/neovim.git /neovim && \
  cd /neovim && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  rm -rf /neovim

# RUN pip3 install --user neovim
RUN pip3 install pynvim sqlparse

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  apt-get install -yq --no-install-recommends \
  nodejs \
  yarn=$YARN_VERSION-1 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  truncate -s 0 /var/log/*log

RUN npm i -g \
  eslint \
  babel-eslint \
  eslint-plugin-react \
  prettier \
  eslint-config-prettier \
  eslint-plugin-prettier \
  eslint-plugin-import \
  stylelint \
  eslint-config-airbnb \
  eslint-plugin-jsx-a11y \
  js-beautify \
  remark-cli \
  fixjson \
  neovim

# Setup non root user
RUN groupadd -g 1000 vi
RUN useradd -m -d /home/vi -s /bin/bash -g vi -u 1000 vi
USER vi

# Install rubocop
RUN gem install \
  ruby-beautify2 \
  rubocop \
  rubocop-performance \
  rubocop-rails \
  rubocop-rspec \
  sass \
  neovim

# TODO: fix ruby-beautify2
# https://github.com/jirutka/ruby-beautify2/issues/1
RUN rm -f /usr/local/bundle/gems/ruby-beautify2-0.98.0/bin/rbeautify && \
 ln -s /usr/local/bundle/gems/ruby-beautify2-0.98.0/bin/ruby-rbeautify \
 /usr/local/bundle/gems/ruby-beautify2-0.98.0/bin/rbeautify

# eslint config
COPY .eslintrc /home/vi/.eslintrc

# Add nvim config
RUN mkdir -p /home/vi/.config/nvim
RUN curl -fLo /home/vi/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY init.vim \
  plugins.vim \
  settings.vim \
  custom.vim \
  ui.vim \
  /home/vi/.config/nvim/

COPY .ctags /home/vi/

# Install neovim plugins
RUN nvim +PlugInstall +qall > /dev/null

# Set the workdir
WORKDIR /src
