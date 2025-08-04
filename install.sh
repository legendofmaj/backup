#!/bin/bash
echo "Making file executable."
chmod +x backup.sh
echo "Copying file to bin. Please grant sudo privileges."
sudo cp -r backup.sh /usr/bin/backup/
echo "Making directory in .config"
mkdir -p $HOME/.config/backup/
echo "Copying default config"
cp -r backup.conf $HOME/.config/backup/