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

git submodule init
git submodule update

CURRENT_WORKING_DIR=`pwd`
cd $HOME


remove_and_reload ".bashrc"
remove_and_reload ".bashrc.d"
remove_and_reload "bin"
remove_and_reload ".gitconfig"
remove_and_reload ".git_completion.bash"
remove_and_reload ".gitignore_global"
remove_and_reload ".gnuplot"
remove_and_reload ".irbrc"
remove_and_reload ".tmux"
remove_and_reload ".tmux.conf"
remove_and_reload ".vim"
remove_and_reload ".vimrc"
remove_and_reload ".vimrc.d"

mkdir .vim_swap


if [[ $(uname -s) == "Darwin" ]] ; then
  rm -rf ".bashrc"
  remove_and_reload ".bash_profile" ".bashrc"

  # Changes screenshots to be stored in ~/Pictures/screenshots
  mkdir -p ~/Pictures/screenshots/
  defaults write com.apple.screencapture location ~/Pictures/screenshots/
  killall SystemUIServer
fi


# Setup git credentials in ~/.gitconfig.local
echo; echo;
read -p "Enter your git user.name: "  GIT_USER_NAME
read -p "Enter your git user.email: " GIT_EMAIL

cat > .gitconfig.local <<EOF
[user]
  name = $GIT_USER_NAME
  email = $GIT_EMAIL
EOF


cd $CURRENT_WORKING_DIR
