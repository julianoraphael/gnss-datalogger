#!/bin/bash

source config/environment.sh

for line in $(cat $INSTALL_PATH/running_PID)
do
kill -9 $line
done