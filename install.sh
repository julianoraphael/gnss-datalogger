#!/bin/bash

export INSTALL_PATH=`/code`
export CONFIG_PATH=$INSTALL_PATH/config

## Create Hourly Basic Crontab
echo "59 * * * * "$INSTALL_PATH"/./collect_raw_data.sh" > $CONFIG_PATH/crontabs/hourly
echo "10 * * * * mv "$INSTALL_PATH"/raw-data/newpids "$INSTALL_PATH"/raw-data/pids" >> $CONFIG_PATH/crontabs/hourly

