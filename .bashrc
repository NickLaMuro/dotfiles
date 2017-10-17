# .bashrc
# 
# Maintainer:  Nick LaMuro
# Based off of default .bashrc from ubuntu install
# 


# ------------------------------ #
#          Bash Aliases          #
# ------------------------------ #

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
[[ -f $DOTFILES_DIR/.bashrc.d/.aliases ]] && . $DOTFILES_DIR/.bashrc.d/.aliases


# ------------------------------ #
#         Bash Variables         #
# ------------------------------ #

# TERM settings for tmux
# 
#[ -n "TMUX" ] && export TERM="screen-256color"
export TERM="screen-256color"

# Default Editor
export EDITOR='vim'


# ------------------------------ #
#       Scripts and Paths        #
# ------------------------------ #

add_to_path $HOME/bin                               # Add custom scripts to PATH
add_to_path /usr/local/heroku/bin                   # Add heroku to PATH
add_to_path /usr/local/lib/node_modules             # Add node_modules to PATH


source_file "$HOME/.bashrc.local"                   # Source local bashrc
source_file "$HOME/.rvm/scripts/rvm"                # Source rvm
source_file $DOTFILES_DIR/.bashrc.d/.source_chruby  # Source chruby


# ------------------------------ #
#   Interactive Bash Settings    #
# ------------------------------ #

if [[ -n "$PS1" ]] ; then
  source_file $DOTFILES_DIR/.bashrc.d/.interactive  # Set interactive settings
  source_file $DOTFILES_DIR/.bashrc.d/.ps1          # Set PS1
  source_file $DOTFILES_DIR/.bashrc.d/.dircolors    # Set dircolors
  source_file $DOTFILES_DIR/.bashrc.d/.completion   # Set dircolors
fi
