#!/bin/bash
# Command for running neovim

if [[ "$1" = /* ]]; then
  file_name="$(basename ${1})"
  dir_name="$(dirname ${1})"
else
  file_name="$1"
  dir_name="$(pwd)"
fi

# Run the docker command
docker run -i -t -P -v "$dir_name":/src blijblijblij/neovim:latest /bin/zsh -c "cd /src; nvim $file_name"
