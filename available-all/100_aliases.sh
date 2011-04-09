if [[ -s /Applications/Emacs.app ]] ;
  then
  ## --- emacs ---
  alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

  ## --- emacs client ---
  ## adapted from http://philipweaver.blogspot.com/2009/08/emacs-23.html

  # start a windowed frame
  alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -c -a /Applications/Emacs.app/Contents/MacOS/Emacs";

  # start a terminal frame
  alias em="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t -a /Applications/Emacs.app/Contents/MacOS/Emacs -nw";

  # do not start a new frame
  alias ea="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -a /Applications/Emacs.app/Contents/MacOS/Emacs";
  
fi