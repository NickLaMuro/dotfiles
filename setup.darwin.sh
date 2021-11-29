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
  # List sourced from here: https://apple.stackexchange.com/a/294411
  #
  # Note:  The above seem wrong, as '@l' below is definitely CMD-l ...
  #
  # updates below with what I have found out from testing...
  #
  #     shift   = $
  #
  defaults write -g NSUserKeyEquivalents -dict-add "Lock Screen" "@l"

  killall SystemUIServer


  # Install Hombrew if it doesn't already exist
  command -v brew > /dev/null
  if [[ "$?" != "0" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    brew install bash
    brew install bash-completion
    brew install tmux
    brew install hub
    brew install ruby-install
    brew install chruby
    brew install rg

    brew install iterm2
    brew install homebrew/cask-fonts/font-meslo-for-powerline
    brew install homebrew/cask-fonts/font-hack-nerd-font # might be my new font
  fi

  # Set default shell to "brew bash"
  #
  # Original instructions here:  https://itnext.io/upgrading-bash-on-macos-7138bd1066ba
  #
  if [[ -x /usr/local/bin/bash ]]; then
    # use ZSH since we know it will be there on Darwin
    #
    # ... however, this script was written in bash... so not sure if it will
    # port to zsh (which we will be using to run it).... oh well...

    sudo /bin/zsh -c "echo '/usr/local/bin/bash' > /etc/shells"
    chsh -s /usr/local/bin/bash
  fi

  cd $CURRENT_WORKING_DIR
fi
