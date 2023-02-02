#!/bin/bash

. function.sh

BAR

CODE [U-44] root 이외의 UID가 ‘0’ 금지

cat << EOF >> $result

[양호]: root 계정과 동일한 UID를 갖는 계정이 존재하지 않는 경우

[취약]: root 계정과 동일한 UID를 갖는 계정이 존재하는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

#@@@@@@@@@500이상으로 하면 되는데, 어떤값으로 하면 좋은지 상의필요.@@@@@@@@@@

# 현재 UID가 0인지 확인
if [ "$(id -u)" -eq 0 ]; then
  # UID를 500으로 변경 
  usermod -u 500 "$USER"
  # UID 변경이 성공했는지 확인
  if [ $? -eq 0 ]; then
    OK "UID가 500으로 변경되었습니다."
  else
    WARN "UID 변경 실패"
  fi
else
  INFO "루트 사용자만 UID를 변경할 수 있습니다"
fi

cat $result

echo ; echo