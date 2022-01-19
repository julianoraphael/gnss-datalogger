#!/bin/bash

source config/environment.sh
rtcm3torinex -M a -d ACAKO -s 3.23.52.207 -r 2101 > $INSTALL_PATH/raw-data/acak0.`date -d '+1 minute' +\%j\%H\%M`.`date -d '+1 minute' +\%y`o & echo $! >> $INSTALL_PATH/PID
