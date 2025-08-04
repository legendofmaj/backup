#!/bin/bash

# check if a flag was passed and if not set a default value.
if [[ ! "$1" ]];
then
    config_file="backup"
else
    config_file="$1"
fi

# because the config file is not in the source repository.
# shellcheck source=/dev/null
source "$HOME/.config/backup/$config_file.conf"

# backup the folders specified in the config.
function backup () {
    for n in "${folders[@]:?}"; # fails if array is unset
    do
        echo "Copying ${home_folder:?}/$n to ${backup_location:?}/$n." # will fail if variable is uninitialized.
        rsync --recursive --update --archive --human-readable --info=progress2 "$home_folder"/"$n"/ "$backup_location"/"$n"/ --delete
    done
}

# make sure the user really want to start a backup. (Configurable via config)
if [[ ${skip_confirmation:=false} == false ]];
then
    echo "Are you sure that you want to copy folders from $home_folder to $backup_location?[y|n]"
    read -r start_backup

    if [[ $start_backup == 'y' ]];
    then
        backup
    elif [ "$start_backup" != 'y' ] && [ "$start_backup" != 'n' ];
    then
        echo "Incorrect input. Aborting."
    else
        echo "Ok. Backup stopped."
    fi
elif [[ $skip_confirmation == true ]];
then
    backup
fi