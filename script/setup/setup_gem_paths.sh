#!/bin/bash

cd ~
mkdir .gems bin lib

# for login shells
echo 'export PATH="$HOME/bin:$HOME/.gems/bin:$PATH"' >> .bash_profile
echo 'export RUBYLIB="$HOME/lib:$RUBYLIB"' >> .bash_profile
echo 'export GEM_HOME="$HOME/.gems"' >> .bash_profile
echo 'export GEM_PATH="$GEM_HOME:/usr/lib/ruby/gems/1.8"' >> .bash_profile
source ~/.bash_profile

# for capistrano
echo 'export PATH="$HOME/bin:$HOME/.gems/bin:$PATH"' >> .bashrc
echo 'export RUBYLIB="$HOME/lib:$RUBYLIB"' >> .bashrc
echo 'export GEM_HOME="$HOME/.gems"' >> .bashrc
echo 'export GEM_PATH="$GEM_HOME:/usr/lib/ruby/gems/1.8"' >> .bashrc
