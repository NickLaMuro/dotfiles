DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

remove_and_reload() {
  source=$2
  if [[ -z $source ]] ; then
    source=$1
  fi

  echo "Linking $1 to $source"
  rm -rf "$1"
  ln -s "$DOTFILES_DIR/$source" "$1"
}

CURRENT_WORKING_DIR=`pwd`
cd $HOME


remove_and_reload ".bashrc"
remove_and_reload ".bashrc.d"
remove_and_reload "bin"
remove_and_reload ".git_completion.bash"
remove_and_reload ".tmux"
remove_and_reload ".tmux.conf"
remove_and_reload ".vim"
remove_and_reload ".vimrc"
remove_and_reload ".vimrc.d"

mkdir .vim_swap


if [[ $(uname -s) == "Darwin" ]] ; then
  rm -rf ".bashrc"
  remove_and_reload ".bash_profile" ".bashrc"

  defaults write com.apple.screencapture location ~/Pictures/screenshots/
  killall SystemUIServer
fi


cd $CURRENT_WORKING_DIR
