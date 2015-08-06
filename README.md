# LIGO-Grid-Computing-ICTS-Questions

This repo/ folder consists of the following files:

1. create_user_account.sh

	*This file is a bash script file to create a user account along with the respective directories. 

	*The help of the script can be obtained by typing :
		./create_user_account.sh -h | --help
		
	*The help section of the script will guide upon how to execute the script file and the arguments required.

	*An example to add user is as follows:
		./create_user_acc.sh -u albert -f albert_einstein -e albert@gmail.com -g LABMATES

2. inverse.c and MakeFile

	*The C file 'inverse.c' is used to find the inverse of a 3X3 matrix using the GSL library. 

	*Prerequisite : 
	GSL library requires to be installed at the default location with the "include" files in /usr/local/include 
	and the library files should be available at /usr/local/lib.
	If GSL is not installed, please do so before running the make file. 
 	Also, if the location of the lib files and include files are different, please update the Makefile appropriately   in the CFLAGS LDFLAG variables.
 
	The Make file is run by typing "make" in the command line. Make sure that the MakeFile and inverse.c are in the    same directory.

3. mysql_script.sh

	This bash script file is used to solve the third question of the question paper. It does the following:
		*creates a database called dogmatix if not exists
		*selects database to be used as dogmatix
		*creates a user called 'ligo'@'localhost' with the dummy userpassword 'ligo'
		*creates grant permissions for 'ligo'@'localhost' for database dogmatix
		*creates a table called ligo_users if not exists, with entries as Name and Email, with the Email field being        the primary key and both being NOT NULL.
		*Inserts the two values given in the paper as entries into the table.

	*TO RUN the script you will require the root account password for MySQL as I have used the login user as root.       you will be prompted to enter the password. Please make sure you have it ready or if you would like to acces       through another mysql user:

	 	*Change the 2nd line in the scipt from "mysql -u root -p$pwd" "mysql -u 'username' -p$pwd".

	*HOW TO RUN : ./mysql_script.sh 	
