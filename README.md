# About
`backup.sh` is a simple shell script that serves as a backup utility.

# Installation
> [!IMPORTANT]
> These commands have to be executed from within this folder. (Or rewritten)
## Option 1 : Install script
Make the script executable
````bash
chmod +x install.sh
````
Run the script
````bash
./install.sh
````
## Option 2 : Manual installation
Make the script executable
````bash
chmod +x backup.sh
````
Copy the script to your bin folder
````bash
sudo cp -r backup.sh /usr/bin/backup/
````
Copy the default configuration to `.config/backup/`
````bash
mkdir -p $HOME/.config/backup/
cp -r backup.conf /.config/backup/
````
# Configuration
To change your settings, edit `~/.config/backup/backup.conf` <br>
## Backup location
You can specify the location you want to copy your files to. <br>
> [!Caution]
> Do not add a trailing `/`.
````bash
backup_location="/mnt/NAS/Michi/Current" # no trailing `/`
````
## Home folder location
Additionally you can customize your home folder. <br>
This can be useful if you want to backup files from all over your system.
````bash
$home_folder=$HOME # default home folder
$home_folder="/" # backup files from all over your system.
````
## Target folders
Lastly you can define the folders you want to back up. <br>
Note that these folders are relative to the home folder you defined. <br>
> [!TIP]
> Should have set your home folder to root, you have to write `home/<your_username>/<folder_name>` here.
````bash
declare -a folders=(
    [0]="Documents/Programming" # folders within folders
    [1]="Downloads"
)
````


