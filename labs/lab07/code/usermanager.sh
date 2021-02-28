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
# 1. https://linuxhint.com/ubuntu-user-management/
# 2. https://ubuntu.com/server/docs/security-users 
# 3. https://zach-gollwitzer.medium.com/how-to-manage-users-and-groups-on-ubuntu-linux-e036f4503107 
###

echo '------------------ usermanager -----------------------'
echo 'This program is for user and group management in Linux'
echo 'It supports:'
echo ' 1. Add, delete, modify groups corresponding to deparments'
echo ' 2. Add, delete, modify members in a group'
echo ' 3. Setup, delete, modify shared resources for a group or several groups'
echo ' 4. Configure groups' and users' access rights on resources'
echo -e '-------------------------------------------------------\n'

echo 'Usage: use single letter command for operation.'
echo 'h - help'
echo 'A - add a group'
echo 'D - delete a group'
echo 'M - modify a group'
echo 'G - join a user to a group'
echo 'L - list all groups'
echo 'a - add a user'
echo 'd - delete a user'
echo 'm - modify a user'
echo 'p - change user password'
echo 'l - list all users'
echo 'g - find all groups a user is in'
echo 'F - create a shared folder for a group'
echo 'R - remove the shared folder from a group'
echo 'S - show the shared folder of a group'
echo 'q - quit the program'
echo


## program main logic

while $true
do
	read -p 'Enter your command: ' cmd


	case "$cmd" in
		"h") # h - help
		echo 'Usage: use single letter command for operation.'
		echo 'h - help'
		echo 'A - add a group'
		echo 'D - delete a group'
		echo 'M - modify a group'
		echo 'G - join a user to a group'
		echo 'L - list all groups'
		echo 'a - add a user'
		echo 'd - delete a user'
		echo 'm - modify a user'
		echo 'p - change user password'
		echo 'l - list all users'
		echo 'g - find all groups a user is in'
		echo 'F - create a shared folder for a group'
		echo 'R - remove the shared folder from a group'
		echo 'S - show the shared folder of a group'
		echo
		;;

		"A") # A - add a group
		read -p "Enter group name: " gname
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
		;;

		"D") # D - delete a group
		read -p "Enter group name: " gname
		if ! grep  -q "^$gname:" /etc/group
		then
			echo "Group named $gname NOT exists."
		else
			### TODO 1: delete the desired group with a single line of command

			###

			if [ $? -eq 0 ]; then
				echo "Succeeded to delete group $gname"
			else
				echo "Failed to delete group $gname"
			fi
		fi
		;;

		"M") # M - modify a group. What do we want to modify? reserved for the time being
		;;

		"L") # L - list all groups
		echo "========= all groups on this computer ============"
		sudo getent group | cut -d ':' -f1 | sort
		echo "=================================================="
		;;

		"G") # G - join a user to a group
		read -p "Enter user name: " uname
		read -p "Enter group name: " gname
		if ! id -u $uname &>/dev/null || ! grep  -q "^$gname:" /etc/group
		then
			echo "User $uname or group $gname or both NOT exist."
		else
			### TODO 2: join the user to  the target group with a single line of command

			###

			if [ $? -eq 0 ]; then
				echo "Succeeded to join user $uname to group $gname"
			else
				echo "Failed to join user $uname to group $gname"
			fi
		fi
		;;

		"a") # a - add/create a user
		read -p "Enter user name: " uname
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
		;;

		"d") # d - delete a user
		read -p "Enter user name: " uname
		if ! id -u $uname &>/dev/null 
		then
			echo "User $uname NOT exists."
		else
			### TODO 3: delete the target user with a single line of command

			###

			if [ $? -eq 0 ]; then
				echo "Succeeded to delete user $uname"
			else
				echo "Failed to delete user $uname"
			fi
		fi
		;;

		"g") # g - find all groups a user is in
		read -p "Enter user name: " uname
		if ! id -u $uname &>/dev/null 
		then
			echo "User $uname NOT exists."
		else
			### TODO 4: find all groups the user is in with a single line of command

			###
		fi
		;;

		"m") # m - modify a user
		;;

		"p") # m - change  user's password
		read -p "Enter user name: " uname
		if ! id -u $uname &>/dev/null 
		then
			echo "User $uname NOT exists."
		else
			### TODO 5: change user's password with a single line of command

			###

			if [ $? -eq 0 ]; then
				echo "Succeeded to change user ${uname}'s password"
			else
				echo "Failed to change user ${uname}'s password"
			fi
		fi
		;;

		"l") # l - list all users
		echo "================== all users on the computer ================"
		sudo cat /etc/shadow | cut -d ':' -f1 | sort
		echo "============================================================="
		;;

		"F") # F - create a shared folder for a group
		read -p "Enter group name: " gname
		if ! grep  -q "^$gname:" /etc/group
		then
			echo "Group named $gname NOT exists."
		else
			sudo mkdir "/opt/$gname"


			### TODO 6: make the  group own its shared folder

			###

			### TODO 7: make the group able to read/write the shared folder with a single line of command

			###

			if [ $? -eq 0 ]; then
				echo "Succeeded to create a shared folder /opt/$gname for group $gname"
			else
				echo "Failed to create a shared folder /opt/$gname for group $gname"
			fi
		fi
		;;

		
		"R") # R - remove the shared folder from a group
		read -p "Enter group name: " gname
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
		;;

		"S") # S - show the shared folder of a group
		read -p "Enter group name: " gname
		if ! [ -d "/opt/$gname" ]
		then
			echo "Group named $gname has NO shared folder."
		else
			echo "=========== All information of the shared folder of group $gname ============="
			sudo ls -la "/opt/$gname"

			echo "=========== The hierarchy of the shared folder of group $gname ============="
			sudo tree "/opt/$gname"
		fi
		;;

		
		"X") # X - reserved for the time being
		;;

		"q") # q - quit the program
		echo "Are you sure to quit this program? Select your choice:"
		select yorn in Y N
		do
			if [ "$yorn" = "Y" ]; then exit 0; fi
		done
		;;

		*)
		echo -e '\nUnsupported command\n'
		;;
	esac
	echo -e "\n\n---------------------------------\n\n"
done

exit 0



