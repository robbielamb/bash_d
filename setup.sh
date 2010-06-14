#!/bin/bash

mv ~/.profile ~/.profile.bak
mv ~/.bash_profile ~/.bash_profile.bak
mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_logout ~/.bash_logout.bak

ln -s ~/.bash.d/core/login.sh ~/.profile
ln -s ~/.bash.d/core/logout.sh ~/.bash_logout
ln -s ~/.bash.d/core/non-interactive.sh ~/.bashrc
