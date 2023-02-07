#!/bin/bash

 

. function.sh


 

BAR

CODE [U-49] 불필요한 계정 제거

cat << EOF >> $result

[양호]: 불필요한 계정이 존재하지 않는 경우

[취약]: 불필요한 계정이 존재하는 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1

# Get the list of users from /etc/passwd that match "lp|uucp|nuucp"
user_list=$(cat /etc/passwd | egrep "lp|uucp|nuucp" | awk -F: '{print $1}')

# Loop through the list of users
for user in $user_list; do
  # Change the user's shell to /bin/false
  usermod -s /bin/false $user
  if [ $? -eq 0 ]; then
    echo "Login is now impossible for user: $user"
  else
    echo "Could not make login impossible for user: $user"
  fi
done




 
cat $result

echo ; echo
