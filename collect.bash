
# PURPOSE: collect useful info from various servers listed in file servers.txt

# REVISION HISTORY:

# AUTHOR				DATE			DETAILS
# --------------------- --------------- --------------------------------
# Linda Adduci	        11-01-2019	     Initial version

# 
# ======================================================================
# VARIABLE ASSIGNMENT
# File containing the list of hosts on which to run the commands to gather data:
hostlist=servers.txt
 
#

while read host;do ssh -n "$host"  "uname -a; df -h" >"info.$host"; done <$hostlist

#######################################################################################################
#End collectinfo script
#######################################################################################################
