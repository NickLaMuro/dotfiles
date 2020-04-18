if [[ $(uname -s) == "Darwin" ]] ; then
  CURRENT_WORKING_DIR=`pwd`
  cd $HOME

  rm -rf ".bashrc"
  remove_and_reload ".bash_profile" ".bashrc"

  # Changes screenshots to be stored in ~/Pictures/screenshots
  mkdir -p ~/Pictures/screenshots/
  defaults write com.apple.screencapture location ~/Pictures/screenshots/

  # Lock Screen with `CMD-L`
  #
  # Note:  This seems to take a while to take effect
  #
  # Other key short hands
  #
  #     command = $
  #     control = ^
  #     option  = ~
  #     shift   = @
  #
  # Note:  The above seem wrong, as '@l' below is definitely CMD-l ...
  #
  # List sourced from here: https://apple.stackexchange.com/a/294411
  #
  defaults write -g NSUserKeyEquivalents -dict-add "Lock Screen" "@l"

  killall SystemUIServer


  cd $CURRENT_WORKING_DIR
fi
