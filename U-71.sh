#!/bin/bash

 

. function.sh

 
TMP1=`SCRIPTNAME`.log

> $TMP1 
 

BAR

CODE [U-71] Apache 웹서비스 정보 숨김

cat << EOF >> $result

[양호]: ServerTokens Prod, ServerSignature Off로 설정되어있는 경우

[취약]: ServerTokens Prod, ServerSignature Off로 설정되어있지 않은 경우

EOF

BAR


# Open the Apache configuration file
sudo nano /etc/httpd/conf/httpd.conf

# Find and edit the ServerTokens setting
sudo sed -i 's/ServerTokens.*/ServerTokens Prod/' /etc/httpd/conf/httpd.conf

# Find and edit the ServerSignature setting
sudo sed -i 's/ServerSignature On/ServerSignature Off/' /etc/httpd/conf/httpd.conf

# Restart Apache to apply the changes
sudo service httpd restart



cat $result

echo ; echo 