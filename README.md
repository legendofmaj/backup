# About
`backup.sh` is a simple shell script that serves as a backup utility.

# Installation
> [!IMPORTANT]
> These commands have to be executed from within this folder. (Or rewritten)
## Option 1 : Install script
Make the install script executable.
````bash
chmod +x install.sh
````
Run the install script.
````bash
./install.sh
````
## Option 2 : Manual installation
Install necessary dependencies. <br>
Install `rsync` using the package manager for your distro. e.g. on Fedora:
````bash
sudo dnf install rsync
````
Make the program executable.
````bash
chmod +x backup.sh
````
Copy the program to your bin folder.
````bash
sudo cp -r backup.sh /usr/bin/backup/
````
Copy the default configuration to `.config/backup/`.
````bash
mkdir -p $HOME/.config/backup/
cp -r backup.conf /.config/backup/
````
# Configuration
## Multiple configurations
`backup.sh` allows you to have multiple configurations. <br>
All configurations need to be stored in `~/.config/backup/`. <br>
You can call different configurations using `backup <name>`. <br>
A configuration called `Android.conf` would hence be called when typing `backup Android`. <br>
Should you only need one config, edit `~/.config/backup/backup.conf`. <br>
## Configuration options
In the following section all options that you can specify in your configuration files will be explained in detail. 
### Backup location
You can specify the location you want to copy your files to. <br>
> [!Caution]
> Do not add a trailing `/`.
````bash
backup_location="/mnt/NAS/Michi/Current" # no trailing `/`
````
### Home folder location
Additionally you can customize your home folder. <br>
This can be useful if you want to backup files from all over your system.
````bash
$home_folder=$HOME # default home folder
$home_folder="/" # backup files from all over your system.
$home_folder="/home/username" # no trailing `/`
````
### Target folders
Mainly you probably want to define the folders you want to back up. <br>
Note that these folders are relative to the home folder you defined. <br>
> [!TIP]
> Should you have set your home folder to root, you have to write `home/<your_username>/<folder_name>` here.
````bash
declare -a folders=(
    [0]="Documents/Programming" # folders within folders
    [1]="Downloads"
)
````
### Skip confirmation
Lastly you can define whether the script asks you every time it is run whether you are sure that you want to back up. This dialogue also shows the target folders and backup location.
````bash
skip_confirmation=true
````