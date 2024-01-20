#!/bin/bash
#Author: Sai Charan Mandadi
#Description: A simple writer script that takes file path and string to be inserted into the file.
#creates the the file directory if the input path is not present.

#Checks for valid input arguments
if [ "$#" -gt 0 ] && [ "$#" -lt 3 ];
then
#If the file already exists insert the string into the file
	if [ -f "$1" ];
	then
		echo $2 > $1
#Create a file or directory if either of them is not present
	else
		if [ -d "$(dirname "$1")" ];
		then
			touch $1
			echo $2 > $1
		else
			echo "Input file is not present, creating new file at $1"
			mkdir -p "$(dirname "$1")"
#checks if mkdir is able to execute without errors
			if [ $? -ne 0 ];
			then
				echo "Unable to create input directory path"
			else
#Insert the input string into the newly created file
				touch $1
				echo $2 > $1
			fi
		fi
	fi
#Handles Invalid number of arguments
else
	echo "Please provide valid arguments"
	exit 1;
fi
