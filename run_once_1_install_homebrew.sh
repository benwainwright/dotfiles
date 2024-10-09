#!/bin/sh

{{ if and (eq .chezmoi.os "linux") (ne (output "command -v yum || echo notfound") "notfound") }}
sudo yum groupinstall 'Development Tools'
sudo yum install procps-ng curl file git
{{ else if ne (output "command -v apt-get || echo notfound") "notfound" }}
sudo apt-get install build-essential procps curl file git
{{ else if ne (output "command -v pacman || echo notfound") "notfound" }}
sudo pacman -S base-devel procps-ng curl file git
{{ else if ne (output "command -v apk || echo notfound") "notfound" }}

wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-2.35-r1.apk
apk add glibc-2.35-r1.apk

{{ end }}

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
