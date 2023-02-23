#!/bin/bash

A=(A P72 P74 P78 01 02 03 04 018 020 025 044 049 056 0142 0251 0316)

B=(A P72 P74 P78 01 02 03 04 018 020 025 044 049 056 0142 0251 0316)

command=./compare_witnesses

database=cacheECM.db


for item1 in "${A[@]}"; do
    for item2 in "${B[@]}"; do
        if [[ $item1 == "$item2" ]]; then
            continue
            break
        fi
    $command -f csv -o /Users/nicholaslamme/Public/open-cbgm-standalone/build/bin/qaTableECM/$item1-$item2.csv $database $item1 $item2
    done
done

cd /Users/nicholaslamme/Public/open-cbgm-standalone/build/bin/qaTableECM/

    for f in *.csv
    do
        sed -e "s/^/${f},/" $f >> combined.csv
done






