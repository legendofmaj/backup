#!/bin/bash

. $HOME/.config/backup/backup.conf

for n in ${folders[@]};
do
    printf "copying $home_folder/$n to $backup_location/$n\n"
    
    #error handeling
    command_output=$(cp -r --update $home_folder/$n/* $backup_location/$n/ 2>&1) #2>&1 redirects all stderr output to stdout
    if [[ $command_output == *'No such file or directory'*  ]];
    then
        echo "In order to not clutter your backup location, the folder $n has not been copied, because such as folder does not exist on your backup location."
        echo "Do you wish to create a folder called $n on your backup location?[y|n]"
        read create_new_folder
        if [[ $create_new_folder == 'y' ]];
        then
            mkdir -p $backup_location/$n
            echo "created $n on your backup location."
        fi
    fi
done