#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run $0 as root."
	exit 1
fi

echo "Installing ramsync . . ."

mkdir /opt/ramsync
cp ramsync /opt/ramsync/
chmod 700 /opt/ramsync/ramsync

cp ramsync.service /etc/systemd/system/ramsync.service
cp ramsync_sync.service /etc/systemd/system/ramsync_sync.service
cp ramsync_sync.timer /etc/systemd/system/ramsync_sync.timer
systemctl enable ramsync.service ramsync_sync.timer

echo "Installation completed. Please reboot."

exit 0
