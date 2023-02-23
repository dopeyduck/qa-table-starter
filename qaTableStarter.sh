#!/bin/bash

# This script compares all witnesses with every other one by looping through two arrays, both of which contain the same number of witnesses. For each comparison, a .csv file is generated and the written to a user-defined directory. The database variable must also be set and the script run from the folder containing the open-cbgm scripts. This script also looks for each place where a witness might be compared to itself. The open-cbgm library doesn't permit this, so this script skips those witness pairs.


A=(A NA28 RP 01 02 03) # Your witnesses go here

B=(A NA28 RP 01 02 03) # Replicate witnesses from array A

command=./compare_witnesses # You must be in the /bin directory where the scripts are to run this command.

database=cache.db # Specify your custom database here.


for item1 in "${A[@]}"; do
    for item2 in "${B[@]}"; do
        if [[ $item1 == "$item2" ]]; then
            continue
            break
        fi
    $command -f csv -o /Users/nicholaslamme/Public/open-cbgm-standalone/build/bin/qaTable/$item1-$item2.csv $database $item1 $item2 # Remove "/Users/nicholaslamme/Public/open-cbgm-standalone/build/bin/qaTable" and replace it with your own custom directory. Leave $item1-$item2.csv as the name of the file.
    done
done

cd /Users/nicholaslamme/Public/open-cbgm-standalone/build/bin/qaTable/ #Put your user defined directory here after cd (the same as you specified above).

    for f in *.csv
    do
        sed -e "s/^/${f},/" $f >> combined.csv
done


# Once the script is done running, you will need to open the combined.csv file in your editor of choice and clean up the file so that it is usable by Excel for generating a QA table. You can see a video of how I have done this at www.youtube.com/