#!/bin/bash

echo "Enter the file or Directory Name"
read name

if [ -d "$name" ]; then
        echo "THis is a Directory...."

elif [ -z "$name" ]; then
        is "It is Invalid"
else
        if [ -f "$name" ]; then
        echo "This is a file....."
        more "$name"
        else
                echo "The given input is not a file and directory..."
        fi

fi