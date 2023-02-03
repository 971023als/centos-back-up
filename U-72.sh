#!/bin/bash

 

. function.sh

 

BAR

CODE [U-72] 정책에 따른 시스템 로깅 설정

cat << EOF >> $result

[양호]: 로그 기록 정책이 정책에 따라 설정되어 수립되어 있는 경우

[취약]: 로그 기록 정책이 정책에 따라 설정되어 수립되어 있지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1 


<<<<<<< HEAD

=======
# 원본 rsyslog.conf 파일 백업
cp /etc/rsyslog.conf /etc/rsyslog.conf.bak

# rsyslog.conf 파일 수정
echo "*.info;mail.none;authpriv.none;cron.none /var/log/messages" > /etc/rsyslog.conf
echo "authpriv.* /var/log/secure" > /etc/rsyslog.conf
echo "mail.* /var/log/maillog" > /etc/rsyslog.conf
echo "cron.* /var/log/cron" > /etc/rsyslog.conf
echo "*.alert /dev/console" > /etc/rsyslog.conf
echo "*.emerg *" > /etc/rsyslog.conf
>>>>>>> 7804081e626ba4c913c4b2a4dcf6e22bd8f046a3


cat $result

echo ; echo 

 
