#######################################################################################################
# 
# ======================================================================
# SCRIPT NAME: alert_filesystem.sh

# PURPOSE: Alert when file system usage surpasses a defined limit 

# REVISION HISTORY:

# AUTHOR				DATE			DETAILS
# --------------------- --------------- --------------------------------
# Linda Adduci	        11-01-2019	     Initial version

# 
# ======================================================================
# 
echo -e "\e[4;32mCHECKING FILE SYSTEM USAGE\e[0m"
THRESHOLD=30
while read line; do
        # This variable stores the file system path as a string
        FILESYSTEM=$(echo $line | awk '{print $1}')
        # This variable stores the use percentage (XX%)
        PERCENTAGE=$(echo $line | awk '{print $5}')
        # Use percentage without the % sign.
        USAGE=${PERCENTAGE%?}
        if [ $USAGE -gt $THRESHOLD ]; then
                echo "The remaining available space in $FILESYSTEM is critically low. Used: $PERCENTAGE"
        fi
done < <(df -h --total | grep -vi filesystem)
#######################################################################################################
#End File System Threshold script script
#