#! /usr/bin/env bash

# Clean up any previous Ruby installation
if [ -x "$(command -v rvm)" ]; then rvm implode && sudo rm -rf ~/.rvm; fi
if [ -d ~/.rbenv ]; then sudo rm -rf ~/.rbenv; fi

# Required packages intalled
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev zlib1g-dev

# Cloning repositories
git clone https://github.com/rbenv/rbenv.git /usr/local/opt/rbenv
echo 'export PATH="/usr/local/opt/rbenv/bin:$PATH"' >> /home/ubuntu/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/ubuntu/.bash_profile

git clone https://github.com/rbenv/ruby-build.git /usr/local/opt/rbenv/plugins/ruby-build
echo 'export PATH="/usr/local/opt/rbenv/plugins/ruby-build/bin:$PATH"' >> /home/ubuntu/.bash_profile
su ubuntu -c 'source /home/ubuntu/.bash_profile'

# Install Ruby required version
su ubuntu -c 'rbenv install $RUBY_VERSION'

# Establish ruby default version
su ubuntu -c 'rbenv global $RUBY_VERSION'

# Gem installs
su ubuntu -c 'gem install bundler rspec rubocop pry pry-byebug hub colored rails'
