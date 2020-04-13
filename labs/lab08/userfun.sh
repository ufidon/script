#!/usr/bin/env bash
###
# This program is for user and group management in Linux
#
# In a company, employees are usually organized in deparment, for example
# Administration, Research and Development, IT, Sales, Purchurse, etc.
# each department consists of personnels. 

# Based on this requirement, this program supports:
# 1. Add, delete, modify groups corresponding to deparments
# 2. Add, delete, modify members in a group
# 3. Setup, delete, modify shared resources for a group or several groups
# 4. Configure groups' and users' access rights on resources
#
# Reference:
# 1. https://vitux.com/add-and-manage-user-accounts-in-ubuntu-18-04-lts/ 
# 2. https://www.cyberciti.biz/faq/understanding-etcgroup-file/
# 3. https://www.cyberciti.biz/faq/understanding-etcpasswd-file-format/
# 4. https://linuxize.com/post/how-to-list-groups-in-linux/
# 5. https://linuxize.com/post/linux-wc-command/
###

function deleteGroup()
{
	if [ -z "$1" ]; then
		echo "Usage: deleteGroup groupname"
		return 1
	fi

	local gname="$1"
	
	if ! grep  -q "^$gname:" /etc/group
	then
		echo "Group named $gname NOT exists."
		return 2
	else
		sudo delgroup $gname

		if [ $? -eq 0 ]; then
			echo "Succeeded to delete group $gname"
		else
			echo "Failed to delete group $gname"
		fi
	fi
}

function addGroup()
{
	if [ -z "$1" ]; then
		echo "Usage: addGroup groupname"
		return 1
	fi

	local gname="$1"	
	
	if grep -q "^$gname:" /etc/group
	then
		echo "Group named $gname exists."
	else
		sudo addgroup $gname

		if [ $? -eq 0 ]; then
			echo "Succeeded to add group $gname"
		else
			echo "Failed to add group $gname"
		fi
	fi	
}

function listGroup()
{
	echo "========= all groups on this computer ============"
	sudo getent group | cut -d ':' -f1 | sort
	echo "=================================================="	
}


# N - find the number of groups on a computer
function numofGroups()
{
	# TODO 1: implement this function
	
	# HINT: any variables defined here should be local
  # You may use any method that you feel comfortable
  # Method 1:
	# 1: find all groups in /etc/group and put them into an array	
	# 2: find the length of the array which is the number of groups
	# 3: show the number of groups
  # Method 2: Follow reference 4&5
	
	# remove syntax error
	:;		
}

# X - find the largest group
function largestGroup()
{
	# get information from /etc/group
	
	# remove syntax error
	:;	
}

function joinGroup()
{
	if [ -z "$2" ]; then
		echo "Usage: joinGroup username groupname"
		return 1
	fi
	
	local uname="$1"
	local gname="$2"
	
	if ! id -u $uname &>/dev/null || ! grep  -q "^$gname:" /etc/group
	then
		echo "User $uname or group $gname or both NOT exist."
	else
		sudo adduser $uname $gname

		if [ $? -eq 0 ]; then
			echo "Succeeded to join user $uname to group $gname"
		else
			echo "Failed to join user $uname to group $gname"
		fi
	fi
}

function newUser()
{
	if [ -z "$1" ]; then
		echo "Usage: newUser username"
		return 1
	fi
	
	local uname="$1"
	
	if id -u $uname &>/dev/null 
	then
		echo "User $uname already exists."
	else
		sudo adduser $uname

		if [ $? -eq 0 ]; then
			echo "Succeeded to create user $uname"
		else
			echo "Failed to create user $uname"
		fi
	fi	
}

function deleteUser()
{
	if [ -z "$1" ]; then
		echo "Usage: deleteUser username"
		return 1
	fi
	
	local uname="$1"	
	
	if ! id -u $uname &>/dev/null 
	then
		echo "User $uname NOT exists."
	else
		sudo deluser $uname

		if [ $? -eq 0 ]; then
			echo "Succeeded to delete user $uname"
		else
			echo "Failed to delete user $uname"
		fi
	fi	
}	


function userGroups()
{
	if [ -z "$1" ]; then
		echo "Usage: userGroups username"
		return 1
	fi
	
	local uname="$1"

	if ! id -u $uname &>/dev/null 
	then
		echo "User $uname NOT exists."
	else
		sudo groups $uname
	fi	
}


# n - find the number of groups a user is in
function numUsergroups()
{
	# TODO2: implement this function
	# HINT: any variables defined here should be local
  # You may use any method that you feel comfortable
  # Method 1:	
	# 1: if the first parameter is empty, show function usage 	
	# 2: handle the exception that the user does not exist	
	# 3: find all groups a user is in, then put all groups into an array	
	# 4: find the length of the array, and show the number of groups the user is in
  # Method 2:
  # Follow reference 4&5

	
	# remove syntax error
	:;	
}

# x - find the user who has maximum memberships
function maxSocialuser()
{

	# remove syntax error
	:;
}

function modPass()
{
	if [ -z "$1" ]; then
		echo "Usage: modPass username"
		return 1
	fi
	
	local uname="$1"	
	
	if ! id -u $uname &>/dev/null 
	then
		echo "User $uname NOT exists."
	else
		sudo passwd $uname

		if [ $? -eq 0 ]; then
			echo "Succeeded to change user ${uname}'s password"
		else
			echo "Failed to change user ${uname}'s password"
		fi
	fi	
}

function listUsers()
{
	echo "================== all users on the computer ================"
	sudo cat /etc/shadow | cut -d ':' -f1 | sort
	echo "============================================================="
}

# u - number of all users on a computer
function numUsers()
{
	# TODO3: Implement this function
	# HINT: any variables defined here should be local	
  # You may use any method that you feel comfortable
  # Method 1:  
	# 1: find all groups in /etc/passwd and put them into an array	
	# 2: find the length of the array which is the number of all users
	# 3: show the number of users
  # Method 2: Follow reference 3&5
	
	# remove syntax error
	:;	
}


function newSharedfolder()
{
	if [ -z "$1" ]; then
		echo "Usage: newSharedfolder groupname"
		return 1
	fi

	local gname="$1"
	
	if ! grep  -q "^$gname:" /etc/group
	then
		echo "Group named $gname NOT exists."
	else
		if [ -d "/opt/$gname" ]; then
			echo "shared folder /opt/$gname already exists"
			return 1
		fi
		
		sudo mkdir "/opt/$gname"
		sudo chgrp $gname "/opt/$gname"
		sudo chmod g+rwx "/opt/$gname"

		if [ $? -eq 0 ]; then
			echo "Succeeded to create a shared folder /opt/$gname for group $gname"
		else
			echo "Failed to create a shared folder /opt/$gname for group $gname"
		fi
	fi	
}

function delSharedfolder()
{
	if [ -z "$1" ]; then
		echo "Usage: delSharedfolder groupname"
		return 1
	fi

	local gname="$1"	
	
	if ! [ -d "/opt/$gname" ]
	then
		echo "Group named $gname has NO shared folder."
	else
		sudo rm -rf "/opt/$gname"

		if [ $? -eq 0 ]; then
			echo "Succeeded to delete the shared folder /opt/$gname of group $gname"
		else
			echo "Failed to delete the shared folder /opt/$gname of group $gname"
		fi
	fi	
}

function showSharedfolder()
{
	if [ -z "$1" ]; then
		echo "Usage: showSharedfolder groupname"
		return 1
	fi

	local gname="$1"
	
	if ! [ -d "/opt/$gname" ]
	then
		echo "Group named $gname has NO shared folder."
	else
		echo "=========== All information of the shared folder of group $gname ============="
		sudo ls -la "/opt/$gname"

		echo "=========== The hierarchy of the shared folder of group $gname ============="
		sudo tree "/opt/$gname"
	fi	
}

function quitProgram()
{
	echo "Are you sure to quit this program? Select your choice:"
	select yorn in Y N
	do
		if [ "$yorn" = "Y" ]; then exit 0; fi
	done	
}

function showDescription()
{
	cat <<_desc_
	------------------ usermanager -----------------------
	This program is for user and group management in Linux
	It supports:
	1. Add, delete, modify groups corresponding to deparments
	2. Add, delete, modify members in a group
	3. Setup, delete, modify shared resources for a group or several groups
	4. Configure groups' and users' access rights on resources
	-------------------------------------------------------
_desc_
}


function showHelp()
{
	cat <<_msg_
	Usage: use single letter command for operation.
	h - help
	A - add a group
	D - delete a group
	M - modify a group
	G - join a user to a group
	L - list all groups
	N - find the number of groups on a computer
	X - find the largest group
	a - add a user
	d - delete a user
	m - modify a user
	p - change user password
	l - list all users
	u - number of all users on a computer
	n - find the number of groups a user is in
	x - find the user who has maximum memberships
	g - find all groups a user is in
	F - create a shared folder for a group
	R - remove the shared folder from a group
	S - show the shared folder of a group
	q - quit the program
	
_msg_
}


## program main logic

showDescription

while $true
do
	read -p 'Enter your command: ' cmd


	case "$cmd" in
		"h") # h - help
		showHelp
		;;

		"A") # A - add a group
		read -p "Enter group name: " groupname
		addGroup $groupname
		;;

		"D") # D - delete a group
		read -p "Enter group name: " groupname
		deleteGroup $groupname

		;;

		"M") # M - modify a group. What do we want to modify? reserved for the time being
		;;

		"L") # L - list all groups
		listGroup
		;;
		
		"N") # N - find the number of groups on a computer
		numofGroups
		;;
		
		"X") # X - find the largest group
		largestGroup
		;;

		"G") # G - join a user to a group
		read -p "Enter user name: " username
		read -p "Enter group name: " groupname
		joinGroup $username $groupname
		;;

		"a") # a - add/create a user
		read -p "Enter user name: " username
		newUser $username
		;;

		"d") # d - delete a user
		read -p "Enter user name: " username
		deleteUser $username
		;;

		"g") # g - find all groups a user is in
		read -p "Enter user name: " username
		userGroups $username
		;;
		
		"n") # n - find the number of groups a user is in
		read -p "Enter user name: " username
		numUsergroups $username
		;;

		"m") # m - modify a user
		;;

		"p") # m - change  user's password
		read -p "Enter user name: " username
		modPass $username
		
		;;

		"l") # l - list all users
		listUsers
		;;
		
		"u") # u - number of all users on a computer
		numUsers
		;;
		
		"x") # x - find the user who has maximum memberships
		maxSocialuser
		;;

		"F") # F - create a shared folder for a group
		read -p "Enter group name: " groupname
		newSharedfolder $groupname
		;;

		
		"R") # R - remove the shared folder from a group
		read -p "Enter group name: " groupname
		delSharedfolder $groupname
		;;

		"S") # S - show the shared folder of a group
		read -p "Enter group name: " groupname
		showSharedfolder $groupname
		;;

		
		"X") # X - reserved for the time being
		;;

		"q") # q - quit the program
		quitProgram
		;;

		*)
		echo -e '\nUnsupported command\n'
		;;
	esac
	echo -e "\n\n---------------------------------\n\n"
done

exit 0
