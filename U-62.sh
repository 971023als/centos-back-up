#!/bin/bash

 

. function.sh

 
TMP1=`SCRIPTNAME`.log

> $TMP1 
 

BAR

CODE [U-62] ftp 계정 shell 제한

cat << EOF >> $result

[양호]: ftp 계정에 /bin/false 쉘이 부여되어 있는 경우

[취약]: ftp 계정에 /bin/false 쉘이 부여되지 않 경우

EOF

BAR



# Open the /etc/passwd file
sed -i 's/\/bin\/bash/\/bin\/false/' /etc/passwd

# Find the line of the ftp account and change it
sed -i '/ftp/s/\/bin\/bash/\/bin\/false/' /etc/passwd

# Verify the changes
grep ftp /etc/passwd




cat $result

echo ; echo 

 
