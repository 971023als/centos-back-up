#!/bin/bash

 

. function.sh
 

BAR

CODE [U-61] ftp 서비스 확인

cat << EOF >> $result

[양호]: FTP 서비스가 비활성화 되어 있는 경우

[취약]: FTP 서비스가 활성화 되어 있는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1 

# Stop vsftpd service
systemctl stop vsftpd

# Wait for all vsftpd processes to complete
while pgrep -x "vsftpd" > /dev/null; do
    sleep 1;
done

# Update system packages
yum update -y vsftpd

# Start vsftpd service
systemctl start vsftpd


cat $result

echo ; echo 
