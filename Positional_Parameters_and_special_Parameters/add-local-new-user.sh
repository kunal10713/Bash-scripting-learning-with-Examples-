#!/bin/bash

# Check if the script is run as root
if [[ "${UID}" -ne 0 ]]
then
    echo 'Please run the script with sudo or as a root user'
    exit 1
fi

# Check if at least one argument (username) is provided
if [[ "${#}" -lt 1 ]]
then
    echo 'Please provide the username'
    echo "Usage: ${0} [ARGUMENT]..."
    exit 1
fi

# Create user
USER_NAME=${1}
shift
COMMENT="${*}"

useradd -c "${COMMENT}" -m "${USER_NAME}"

# Generate a random password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Set password
echo "${USER_NAME}:${PASSWORD}" | chpasswd

if [[ "${?}" -ne 0 ]]
then
    echo 'The password for the account could not be set.'
    exit 1
fi

# Force password change on first login
passwd -e "${USER_NAME}"

# Display the username, password, and the host where the user was created
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"

exit 0

