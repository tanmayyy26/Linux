#!/bin/bash
read -p "Enter the name : " name
echo -e "${name,,}"
echo -e "${name^^}"
figlet "$name"