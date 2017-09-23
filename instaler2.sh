#!/bin/bash
echo "Welcome to this automated installer"
echo "Creating script service"

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

python script.py
sudo touch "/lib/systemd/system/myscript.service"
sudo touch $FILENAME

#echo text > installer.txt
#FILENAME="/lib/systemd/system/myscript.service"
FILENAME="installer.txt"
declare -a TEXT=("[Unit]"
                "Description=My Script Service"
                "After=multi-user.target"
                "[Service]"
                "Type=idle"
                "ExecStart=/usr/bin/python /home/ekirapa/Paul/Projects/Learning/python/Systemd-python-service-/script.py"
                "[Install]"
                "WantedBy=multi-user.target"
)
touch $FILENAME
DESTDIR=$FILENAME
if [ -f "$DESTDIR" ]
then
    echo "issa dir $DESTDIR"
    #for i in "${arr[@]}"
        echo "world" >  $DESTDIR
    #sudo chmod 644 /lib/systemd/system/myscript.service
else 
    echo "is not a dir $DESTDIR"
fi


