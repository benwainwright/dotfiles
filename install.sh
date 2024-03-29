#!/usr/bin/env zsh

DOTFILES=~/dotfiles
SCRIPTS=$DOTFILES/install/scripts


source $SCRIPTS/index.sh

symlink_dotfiles

if command -v apt > /dev/null; then
    install_debian_deps
fi

if [[ $(uname) == "Darwin" ]]; then
    copy_fonts
    install_brew_dependencies
    set_macos_defaults
    set_iterm_preferences_location
fi

if command -v apt > /dev/null || command -v freebsd-version > /dev/null; then
    install_linux_deps
fi


if command -v freebsd-version > /dev/null; then
    install_freebsd_deps
fi


if [ $python ] || [ $all ]; then
    install_python_3
fi

generate_ssh

yes | source ~/.zshrc

install_go_deps

install_gvm
