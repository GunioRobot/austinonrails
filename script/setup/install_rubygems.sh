#!/bin/bash

mkdir ~/src
cd ~/src
wget http://rubyforge.org/frs/download.php/43985/rubygems-1.3.0.tgz
tar xzvf rubygems-1.3.0.tgz
cd rubygems-1.3.0
ruby setup.rb --prefix=$HOME
ln -s ~/bin/gem1.8 ~/bin/gem
cd ~
