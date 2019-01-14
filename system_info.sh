#!/bin/bash
# 
# ======================================================================
# SCRIPT NAME: system_info.sh

# PURPOSE: show info on system the user is currently logged on

# REVISION HISTORY:

# AUTHOR				DATE			DETAILS
# --------------------- --------------- --------------------------------
# Linda Adduci	        11-01-2019	     Initial version

# 
# ======================================================================


# VARIABLE ASSIGNMENT
# Show hostname:
HOST=$(hostname)
# User executing the script:
CURRENTUSER=$(whoami)
#Logged-in users:
USERSLOGGED=$(who)
# Current date:
CURRENTDATE=$(date +%F)
# Host IP address:
IPADDRESS=$(hostname -I | cut -d ' ' -f1)
#File System Disk Space Usage
DISKSPACEUSAGE=$(df -h)
#Free and used Memory
FREEMEM=$(free)
#System uptime and load:
UPTIME=$(uptime)
#Top 5 processes as far as memory usage is concerned
TOP5MEM=$(ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6)



# SHOW MESSAGES
echo "Today is $CURRENTDATE"
echo "Hostname: $HOST ($IPADDRESS)"
echo "User info for $CURRENTUSER:"
grep $CURRENTUSER /etc/passwd
echo "Users logged in: $USERSLOGGED "
echo "Disk Space usage is: $DISKSPACEUSAGE"
echo "Free and used Memory in the System is: $FREEMEM"
echo "System uptime and load is:$UPTIME"
echo "Top 5 processes as far as memory usage is concerned: $TOP5MEM"


#End systeminfo script