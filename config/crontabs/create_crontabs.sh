#!/bin/bash
source ../environment.sh

## Make backup to create a 'basic' crontab
if [ -e $CONFIG_PATH/crontabs/hourly ]
then
    mv $CONFIG_PATH/crontabs/hourly $CONFIG_PATH/crontabs/hourly_bkp_`date +\%d\%H\%M`
fi

## Create Hourly Basic Crontab
echo "#!/bin/bash" > $CONFIG_PATH/crontabs/hourly
echo "## Automatically generated crontab" >> $CONFIG_PATH/crontabs/hourly
echo "## Start collecting data, one minute before the next hour" >> $CONFIG_PATH/crontabs/hourly
echo "59 * * * * cd "$INSTALL_PATH"; /bin/bash -e \"$INSTALL_PATH/collect_raw_data.sh\"" >> $CONFIG_PATH/crontabs/hourly
echo "## Move PID's control file" >> $CONFIG_PATH/crontabs/hourly
echo "10 * * * * mv "$INSTALL_PATH"/PID "$INSTALL_PATH"/running_PID" >> $CONFIG_PATH/crontabs/hourly
echo "## Kill process, one minute after the complete of data collection" >> $CONFIG_PATH/crontabs/hourly
echo "01 * * * * cd "$INSTALL_PATH";/bin/bash -e \"$INSTALL_PATH/kill_running.sh\"" >> $CONFIG_PATH/crontabs/hourly

crontab $CONFIG_PATH/crontabs/hourly