#!/bin/bash

read -p "Enter the path of file of directory: " FILE

if [ -f "$FILE" ]
then
 echo "$FILE is a regular file."
exit 0
elif [ -d "$FILE" ]
then
 echo "$FILE is a directory."
exit 1
else
 echo "$FILE is a something other then the regular file or directory."
exit 2
fi
