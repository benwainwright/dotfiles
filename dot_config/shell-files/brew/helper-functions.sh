saveBrewfile() {
  brew bundle dump --file ~/.config/shell-files/brew/Brewfile
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
    else
        command brew "$subcommand" "$@"
    fi
}

