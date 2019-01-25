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
threshold=30
while read line; do
        # This variable stores the file system path as a string
        filesystem=$(echo $line | awk '{print $1}')
        # This variable stores the use percentage (XX%)
        percentageE=$(echo $line | awk '{print $5}')
        # Use percentage without the % sign.
        usage=${percentage%?}
        if [ $usage -gt $threshold ]; then
                echo "The remaining available space in $filesystem is critically low. Used: $percentage"
        fi
done < <(df -h --total | grep -vi filesystem)
#######################################################################################################
#End File System Threshold script script
#
