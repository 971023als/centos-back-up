#!/bin/bash

. function.sh

BAR

CODE [U-45] root 계정 su 제한		

cat << EOF >> $result

[양호]: su 명령어를 특정 그룹에 속한 사용자만 사용하도록 제한되어 있는 경우
※ 일반사용자 계정 없이 root 계정만 사용하는 경우 su 명령어 사용제한 불필요

[취약]: su 명령어를 모든 사용자가 사용하도록 설정되어 있는 경우

EOF

BAR


# 새그룹명
new_group=whell

# su 명령에 대한 액세스가 필요한 사용자 목록
users=("root" "bin" "daemon" "adm" 
"lp" "sync" "shutdown" "halt" 
"mysql" "dbus" "rpc" "rpcuser" "haldaemon" 
"apache" "postfix" "gdm" "adiosl")

# 새 그룹에 사용자 추가
for user in $users; do
  sudo usermod -a -G $new_group $user
done

cat $result

echo ; echo

