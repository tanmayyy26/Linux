#!/bin/bash

if [ -z "$1" ]; then

echo "Usage: $0 <UID>"

exit 1

fi

UID_INPUT=$1

USER_INFO=$(getent passwd "$UID_INPUT")

if [ -z "$USER_INFO" ]; then

echo "No user found with UID: $UID_INPUT"

exit 1

fi

USER_NAME=$(echo "$USER_INFO" | cut -d: -f1)

HOME_DIR=$(echo "$USER_INFO" | cut -d: -f6)

SHELL=$(echo "$USER_INFO" | cut -d: -f7)

USER_GROUPS=$(id -Gn "$USER_NAME")

echo "User Name: $USER_NAME"

echo "Home Directory: $HOME_DIR"

echo "Shell: $SHELL"

echo "Groups: $USER_GROUPS"