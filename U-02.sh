#!/bin/bash

. function.sh

BAR

CODE [U-02] 패스워드 복잡성 설정

cat << EOF >> $result

[양호]: 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우

[취약]: 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# 원본 파일을 백업하다
cp /etc/pam.d/system-auth /etc/pam.d/system-auth.bak

# 최소 암호 길이를 8자로 설정
sed -i 's/password    requisite     pam_cracklib.so try_first_pass retry=3 type=.*/password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=8/' /etc/pam.d/system-auth

# 영문, 숫자 및 특수 문자 필요
echo "password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=8 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1" >> /etc/pam.d/system-auth

cat $result

echo ; echo