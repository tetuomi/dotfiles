#!/bin/bash

rm -fr .rbenv/

sudo apt-get install -y git curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev sqlite3 libsqlite3-dev

# Node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs


git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo -e '\n\nexport PATH=$HOME/.rbenv/bin:$PATH' >> ~/.bashrc

echo $PATH > log
export PATH=$HOME/.rbenv/bin:$PATH
source ~/.bashrc
hash -r

echo 'eval "$(rbenv init -)"' >> ~/.bashrc
eval "$(rbenv init -)"

source ~/.bashrc
hash -r

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc
hash -r
echo $PATH

rbenv install -l
rbenv install 2.5.1

echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

rbenv global 2.5.1
rbenv rehash
gem i rbenv-rehash

gem i rails -v 5.1.6

gem install sqlite3 -v '1.3.13'

wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

gem cleanup
gem list
gem -v
rails -v
heroku -v
