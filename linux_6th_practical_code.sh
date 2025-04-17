#!/bin/bash
read -p "enter a word" word
n=0
while read -n1 char; do
        n=$(( n+1 ))
done < <(echo -n "$word" )
echo "$n"