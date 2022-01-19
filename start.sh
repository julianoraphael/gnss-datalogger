#!/bin/bash
while IFS="," read server port mountpoint
do
    echo "ntrip -s "$server "-r" $port "-m" $mountpoint
done < $CONFIG_PATH/stations.csv
