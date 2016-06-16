# Set PS1 prompt
# 
# Maintainer: Nick LaMuro
# Based off of default ~/.bashrc from ubuntu install
# 

# Default $PS1_TAIL (modified if on linux with no color)
PS1_TAIL='\[\033[01;34m\]\W \$\[\033[00m\] '

case $(uname -s) in 
  "Linux")
    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
      debian_chroot=$(cat /etc/debian_chroot)
    fi

    if [[ "${linux_use_color}" == "true" ]] ; then
      if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h:'
      else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h:'
      fi

    else
      if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h'
      else
        PS1='\u@\h'
      fi

      PS1_TAIL='\W \$ '
    fi
    ;;
  "Darwin")
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagacad
    PS1='\[\033[01;32m\]\u@\h:'
    ;;
esac

if [ -f $DOTFILES_DIR/.bashrc.d/.git_completion.bash ]; then
  source $DOTFILES_DIR/.bashrc.d/.git_completion.bash
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWUPSTREAM=1
  GIT_PS1='$(__git_ps1 "\[\033[1;33m\] Git:(%s)")'
  PS1="$PS1$GIT_PS1"
fi


PS1="$PS1 $PS1_TAIL"
