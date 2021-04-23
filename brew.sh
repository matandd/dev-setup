#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget

# Install Python
brew install python
brew install python3

# Install more recent versions of some OS X tools.
brew install grep
brew install openssh

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install binutils
brew install binwalk
brew install dex2jar
brew install nmap
brew install socat
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install pkg-config libffi
brew install pandoc
brew install tmux
brew install starship
brew install android-platform-tools

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Core casks
brew install --cask --appdir="/Applications" raycast
brew install --cask --appdir="~/Applications" iterm2
brew install homebrew/cask-versions/adoptopenjdk8 --cask
brew install --cask --appdir="~/Applications" xquartz

# Development tool casks
brew install --cask --appdir="/Applications" macdown
brew install --cask --appdir="/Applications" zettlr
brew install --cask --appdir="/Applications" joplin
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" jetbrains-toolbox

# Misc casks
brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" firefox
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" mattermost
brew install --cask --appdir="/Applications" openfortivpn
brew install --cask --appdir="/Applications" keepassxc
brew install --cask --appdir="/Applications" netnewswire
brew install --cask --appdir="/Applications" anydesk
brew install homebrew/cask-drivers/logitech-options

# Install Docker, which requires virtualbox
brew install docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
