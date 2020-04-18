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


  # Install Hombrew if it doesn't already exist
  command -v brew > /dev/null
  if [[ "$?" != "0" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    brew install bash
    brew install tmux
    brew install hub
    brew install ruby-install
    brew install chruby
    # brew install iterm2  # maybe another time...
    brew install homebrew/cask-fonts/font-meslo-for-powerline
  fi

  cd $CURRENT_WORKING_DIR
fi
