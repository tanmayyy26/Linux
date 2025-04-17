#!/bin/bash
# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <file_name> <line_to_append>"
	exit 1
fi
# Assigning arguments to variables 
file_name=$1
line_to_append=$2
# Append the line to the file 
echo "$line_to_append" >> "$file_name"
# Count thr total number of lines in the file
line_count=$(wc -l < "$file_name")
# Print the number of lines 
echo "The file '$file_name' now has $line_count lines."

