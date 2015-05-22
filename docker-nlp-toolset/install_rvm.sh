#!/bin/bash
set -e

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh

rvm requirements
rvm install jruby-1.7.10
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
gem install bundler --no-ri --no-rdoc
rvm use --create jruby-1.7.10@nlp-toolset
gem install bundler
# Help cache gems even though the NlpToolset repo has the most up to date Gemfile's this still helps.
bundle install
