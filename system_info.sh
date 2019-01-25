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
host=$(hostname)
# User executing the script:
currentuser=$(whoami)
#Logged-in users:
userslogged=$(who)
# Current date:
currentdate=$(date +%F)
# Host IP address:
ipaddress=$(hostname -I | cut -d ' ' -f1)
#File System Disk Space Usage
diskspaceusage=$(df -h)
#Free and used Memory
freemem=$(free)
#System uptime and load:
Uptime=$(uptime)
#Top 5 processes as far as memory usage is concerned
top5mem=$(ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6)



# SHOW MESSAGES
echo "Today is $currentdate"
echo "Hostname: $host ($ipaddress)"
echo "User info for $currentuser:"
grep $currentuser /etc/passwd
echo "Users logged in: $userslogged "
echo "Disk Space usage is: $diskspaceusage"
echo "Free and used Memory in the System is: $freemem"
echo "System uptime and load is:$Uptime"
echo "Top 5 processes as far as memory usage is concerned: $top5mem"


#End systeminfo script
