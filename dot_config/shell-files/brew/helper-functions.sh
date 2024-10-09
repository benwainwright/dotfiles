export BREWFILE=~/.config/shell-files/brew/Brewfile

saveBrewfile() {
  rm $BREWFILE
  brew bundle dump --all --file $BREWFILE
}

brew() {
    local subcommand="$1"
    shift

    if [ "$subcommand" = "install" ]; then
        command brew install "$@"
        saveBrewfile
    elif [ "$subcommand" = "remove" ]; then
        command brew rmtree "$@"
        saveBrewfile
    elif [ "$subcommand" = "uninstall" ]; then
        command brew rmtree "$@"
        saveBrewfile
    else
        command brew "$subcommand" "$@"
    fi
}

