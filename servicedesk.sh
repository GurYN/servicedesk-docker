#!/bin/bash
#
# Startup script for Service Desk Plus (Docker Version)

INITLOG_ARGS=""
RETVAL=0
MDIR=/opt/ManageEngine/ServiceDesk/bin

if [ ! -d "$MDIR" ]
then
 echo "Invalid directory $MDIR"
    exit 1
fi

mv -f /var/log/servicedesk-plus.log /var/log/servicedesk-plus1.log
echo "Starting ManageEngine ServiceDesk-Plus (Docker Edition)"
cd $MDIR
nohup sh run.sh >/var/log/servicedesk-plus.log 2>&1 &
RETVAL=$?
echo
[ $RETVAL = 0 ] && touch /var/lock/subsys/servicedesk

exit $RETVAL 
