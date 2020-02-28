FROM ruby:2.4-slim-buster

# Locales
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8

# Better terminal support
ENV TERM screen-256color
ENV DEBIAN_FRONTEND noninteractive

# node
ENV NODE_MAJOR 12

# Common packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  curl \
  fzf \
  git  \
  libevent-dev \
	locales \
	python3-neovim \
  python3-dev \
  python3-pip \
  rubygems \
  silversearcher-ag \
  software-properties-common \
  tidy \
  tzdata \
  zsh \
  silversearcher-ag && \
	locale-gen en_US.UTF-8 && \
	chsh -s /usr/bin/zsh && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --user neovim
RUN pip3 install pynvim sqlparse

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Install dependencies
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  nodejs &&\
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
  fixjson

# Setup non root user
RUN groupadd -g 1000 vi
RUN useradd -m -d /home/vi -s /bin/bash -g vi -u 1000 vi
USER vi

# Install rubocop
RUN gem install \
  ruby-beautify \
  rubocop \
  rubocop-performance \
  rubocop-rails \
  rubocop-rspec \
  sass

# eslint config
COPY .eslintrc /home/vi/.eslintrc

# Add nvim config
RUN mkdir -p /home/vi/.config/nvim
RUN curl -fLo /home/vi/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY init.vim plugins.vim /home/vi/.config/nvim/

# Install neovim plugins
RUN vim +PlugInstall +qall > /dev/null

# Set the workdir
WORKDIR /src
