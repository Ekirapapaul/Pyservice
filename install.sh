#!/bin/bash
echo "Welcome to this automated installer"
echo "Creating script service"

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

#echo text > installer.txt
FILENAME="/lib/systemd/system/myscript.service"
touch $FILENAME

DESTDIR=$FILENAME
declare -a TEXT=("[Unit]"
                "Description=My Script Service"
                "After=multi-user.target"
                "[Service]"
                "Type=idle"
                "ExecStart=/usr/bin/python /home/ekirapa/Paul/Projects/Learning/python/Systemd-python-service-/script.py"
                "[Install]"
                "WantedBy=multi-user.target"
)


if [ -f "$DESTDIR" ]
then
    echo "Creating service file in /lib/systemd/myscript.service"
    for i in "${TEXT[@]}"
        do
            echo "$i" >>  $DESTDIR
        done
    sudo chmod 644 /lib/systemd/system/myscript.service
    sudo systemctl daemon-reload
    sudo systemctl enable myscript.service

    echo "Attempting to start "
    systemctl restart myscript.service
    sudo systemctl status myscript.service
else 
    echo "An error ooccured while creating service file. Contact developer"
fi

