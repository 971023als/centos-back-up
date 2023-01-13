#!/bin/bash

 

. function.sh

TMP1=`SCRIPTNAME`.log

> $TMP1   

 

BAR

CODE [U-61] ftp 서비스 확인

cat << EOF >> $result

[양호]: FTP 서비스가 비활성화 되어 있는 경우

[취약]: FTP 서비스가 활성화 되어 있는 경우

EOF

BAR


# Stop FTP service
service vsftpd stop

# Disable FTP service from starting at boot
chkconfig vsftpd off

# Remove FTP package
yum remove vsftpd -y

# Block FTP ports in firewall
iptables -I INPUT -p tcp --dport 21 -j DROP
iptables -I INPUT -p tcp --dport 20 -j DROP

# Save firewall rules
service iptables save

cat $result

echo ; echo 
