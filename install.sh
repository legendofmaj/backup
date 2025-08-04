#!/bin/bash

declare -a dependencies=(
    [0]="rsync"
)

echo "Installing dependencies. Please grant sudo privileges."
current_os=$(cat /etc/*-release)
for current_dependency in "${dependencies[@]}";
do
    if [[ $current_os = *'Fedora'* ]];
    then
        sudo dnf install "$current_dependency"
    elif [[ $current_os = *'Ubuntu'* ]];
    then
        sudo apt install "$current_dependency"
    elif [[ $current_os = *'Arch'* ]];
    then
        sudo pacman -S rsync "$current_dependency"
    else
        echo "Your distro is not supported. Please install $current_dependency manually."
    fi
done

echo "Making file executable."
chmod +x backup.sh

echo "Copying file to bin. Please grant sudo privileges."
sudo cp -r backup.sh /usr/bin/backup

echo "Making directory in .config."
mkdir -p "$HOME"/.config/backup/

echo "Copying default config."
cp -r backup.conf "$HOME"/.config/backup/