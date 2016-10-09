#! /usr/bin/env bash

# Clean up any previous Ruby installation
if [ -x "$(command -v rvm)" ]; then rvm implode && sudo rm -rf ~/.rvm; fi
if [ -d ~/.rbenv ]; then sudo rm -rf ~/.rbenv; fi

# Required packages intalled
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev zlib1g-dev

# Cloning repositories
git clone https://github.com/rbenv/rbenv.git /usr/local/opt/rbenv
echo 'export PATH="/usr/local/opt/rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone https://github.com/rbenv/ruby-build.git /usr/local/opt/rbenv/plugins/ruby-build
echo 'export PATH="/usr/local/opt/rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby required version
rbenv install $RUBY_VERSION

# Establish ruby default version
rbenv global $RUBY_VERSION

# Gem installs
gem install bundler rspec rubocop pry pry-byebug hub colored tty-prompt nokogiri rails
