#!/bin/bash
clear
if command -v brew >/dev/null 2>&1 ; then
  echo "Updating the Homebrew"
  brew update
  brew upgrade
  brew cleanup
  brew cask cleanup
  brew prune
  brew bundle dump --global --force
fi

if command -v apm >/dev/null 2>&1 ; then
  echo "Updating Atom"
  apm update
  apm upgrade --no-confirm --no-color
  apm clean
fi

if command -v npm >/dev/null 2>&1 ; then
  echo "Updating Npm"
  npm install --global --progress false npm@latest
  npm update --global --progress false
fi

if ! command -v gem >/dev/null 2>&1 ; then
  echo "Updating Gem"
  gem update --system
  gem cleanup
fi
