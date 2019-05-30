#!/bin/bash
#
# usage: ./vim_plugin.sh [add|remove] [CLONE_URL|DIR]
#
# Adds a vim plugin to the plugins directory for this repo... because I can't
# be bothered to remember the `git submodule ...` syntax every time...
#
#   source | add:  Add vim plugin from CLONE_URL (required)
#   remove | del:  Remove plugin from DIR (required)
#   help:          Print this help
#
# For `add`ing, the `.vim/bundles/*` directory will be auto configured by the
# URL passed in.
#
# When `remove`ing, the full path should be provided, minus the trailing slash
#
# Note: for both commands, a commit is still needs to be created manually.
#

help() {
  sed -e'1,2d' -e'3,$ s/^# \{0,1\}\(.*\)$/\1/' -e'tx' -e'c\' -e'q' -e':x' $0
}

add_plugin() {
  # Extract the plugin name from the URL:
  #
  # Example:
  #
  #     https://github.com/NickLaMuro/vim-fake-plugin.git => "vim-fake-plugin"
  #
  local PLUGIN_BASENAME=${1##*/}
  local PLUGIN_NAME=${PLUGIN_BASENAME%%.*}

  git submodule add $1 ".vim/bundles/$PLUGIN_NAME"
}

delete_plugin() {
  # Extract Plugin name from dir (if a dir path is passed), and remove any
  # trailing slashes.  Allows passing either a plugin name or the full path and
  # both are accepted.
  #
  # Examples:
  #
  #     ".vim/bundles/vim-fake-plugin/" => "vim-fake-plugin"
  #     ".vim/bundles/vim-fake-plugin"  => "vim-fake-plugin"
  #     "vim-fake-plugin/"              => "vim-fake-plugin"
  #     "vim-fake-plugin"               => "vim-fake-plugin"
  #
  local STRIPPED_PATH=${1%/}
  local PLUGIN_NAME=${STRIPPED_PATH#.vim/bundles/}

  if [ ! -d ".vim/bundles/$PLUGIN_NAME" ]; then
    echo "ERR:  Plugin '$PLUGIN_NAME' does not exist."
    exit 1
  fi

  git submodule deinit -f -- .vim/bundles/$PLUGIN_NAME
  rm -rf .git/modules/.vim/bundles/$PLUGIN_NAME
  git rm -f .vim/bundles/$PLUGIN_NAME
}

case "$1" in
source|add)  add_plugin $2    ;;
remove|del)  delete_plugin $2 ;;
help|*)      help
             exit 0
             ;;  
esac
