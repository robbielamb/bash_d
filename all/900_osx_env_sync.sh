if [[ -s $HOME/.MacOSX/environment ]] ; then
  defaults write $HOME/.MacOSX/environment PATH "$PATH"
fi

