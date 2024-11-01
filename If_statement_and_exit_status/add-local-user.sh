#!/bin/bash

if [[ ${UID} -ne 0 ]]
then
 	echo 'Please run the script with sudo or a root'
	exit 1
fi

# Get user info
read -p "Enter the username to create: " USERNAME
read -p "Enter the name of the person or application that will be using this account: " FULL_NAME
read -p "Enter the password to use for the account: " PASSWORD

# Create user
useradd -c "${FULL_NAME}" -m "${USERNAME}"

# Check is account get created or not?
if [[ "${?}" -ne 0 ]]
then
	echo 'The account ccould not be created'
	exit 1
fi

# Set password
echo ${PASSWORD}  | passwd --stdin ${USERNAME}


echo "Changing password for user ${USERNAME}."


if [[ "${?}" -ne 0 ]]
then
	echo 'The password for  the account could not be set.'
	exit 1
fi

# Force password change on first login
passwd -e ${USERNAME}

# Display the username, password, and the host where the user was created 
echo
echo 'username: '
echo "${USERNAME}"
echo 
echo 'password: '
echo "{PASSWORD]"
echo
echo 'host: '
echo "${HOSTNAME}"
exit 0
