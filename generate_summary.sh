#! /bin/bash

# Setup Variables
WORKINGDIR="/data/Service/Parts Needed"

# Check for existance of summary.txt and create file if it doesnt exist
touch "$WORKINGDIR/summary.txt"

# Set variable for summary.txt to allow easy writing
SUMMARY="$WORKINGDIR/summary.txt"

# Main Function
main(){
	echo -e "This file is a automatically generated summary of parts needed as of $(date "+%A, %B %d %I:%M %p")" > "$SUMMARY"
	for i in "$WORKINGDIR"/parts/*.csv; do
		echo -e "\n\n$(basename "$i") \n\n$(awk -F ";" -f "$WORKINGDIR"/text_processing.awk "$i")" >> "$SUMMARY"
	done
}

# Call Main function
main
