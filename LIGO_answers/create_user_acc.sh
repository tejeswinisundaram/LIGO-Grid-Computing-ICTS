#!/bin/bash

 show_help() {
   cat << EOF


   /*************************************************************************************************/

   Usage: ./create_user_accounts.sh [-h|--help] -e {email-id} -f {full-name} -u {username} -g {group-name}

	-h|--help          display this help and exit.
	-f                 input the fullname of user. 
	-e                 input email id of the user.
	-g                 GROUPNAME input group name of the user.
	-u                 USERNAME input user name of the user.

   /*************************************************************************************************/

	Example : ./create_user_acc.sh -u albert -f albert_einstein -e albert@gmail.com -g ICTSC

   /*************************************************************************************************/


EOF
 }
 
#TEMP=`getopt -o hf:e:g:u:: --long help,fullname:,email:,usergroup:,username:: \
 #    -n 'create_user_acc.sh' -- "$@"`


#eval set -- "$TEMP";

while getopts ":he:f:u:g: --long help" opt; do
case $opt in
#while true ; do
#   case "$1" in
    h|--help)
	show_help
	exit 0
	;;
    e|--email)
      echo "-e : $OPTARG" >&2
      INFO=$OPTARG
      ;;
    f|--fullname)
      echo "-f : $OPTARG" >&2
      INFO="$INFO $OPTARG"
      ;;
    u|--username)
      echo "-u : $OPTARG" >&2
      USER=$OPTARG
      ;;
    g|--usergroup)
      echo "-g : $OPTARG" >&2
      GROUP=$GROUP
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ ! -d "/archive" ]; then
   echo "/archive doesnt exists! Creating directory ...";
   sudo mkdir /archive;
else
   echo "/archive exists";
fi

if [ ! -d "/archive/home" ]; then
   echo "/archive/home doesnt exists! Creating directory ...";
   sudo mkdir /archive/home;
else
   echo "/archive/home exists";
fi

if [ ! -d "/scratch" ]; then
   echo "/scratch doesnt exists! Creating directory ...";
   sudo mkdir /scratch;
else
   echo "/scratch exists";
fi

if [ ! -d "/archive/home/$USER" ]; then
   echo "/archive/home/$USER doesnt exists! Creating directory ...";
   sudo mkdir /archive/home/$USER;
else
   echo "/archive/home/$USER exists";
fi

if [ ! -d "/scratch/$USER" ]; then
   echo "/scratch doesnt exists! Creating directory ...";
   sudo mkdir /scratch/$USER;
else
   echo "/scratch/$USER exists";
fi

HOME="/var/archive/home/$USER";
sudo useradd $USER -c $INFO -U $GROUP -d $HOME
if [ $? -eq 0 ]; then
    echo "user $USER added"; 
else
    echo "failed to added user! try again.";
fi

echo "changing user access...";
sudo chown $USER /archive/home/$USER;
sudo chown $USER /scratch/$USER;
sudo chmod -R 754 /archive/home/$USER;
sudo chmod -R 754 /scratch/$USER;
echo "Script executed completely!";
