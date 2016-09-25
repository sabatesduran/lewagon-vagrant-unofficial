#! /usr/bin/env bash

# Clean up any previous Ruby installation
if [ -x "$(command -v rvm)" ]; then rvm implode && sudo rm -rf ~/.rvm; fi
if [ -d ~/.rbenv ]; then sudo rm -rf ~/.rbenv; fi

# Required packages intalled
sudo apt-get install -y build-essential tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev libreadline-dev
sudo apt-get clean
sudo mkdir -p /usr/local/opt && sudo chown `whoami`:`whoami` $_

# Cloning repositories
git clone https://github.com/rbenv/rbenv.git /usr/local/opt/rbenv
git clone https://github.com/rbenv/ruby-build.git /usr/local/opt/rbenv/plugins/ruby-build

# Updating bash
source ~/.bashrc

# Install Ruby required version
rbenv install $RUBY_VERSION

# Establish ruby default version
rbenv global $RUBY_VERSION

# Gem installs
gem install bundler rspec rubocop pry pry-byebug hub colored