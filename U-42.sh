#!/bin/bash

 

. function.sh 
 

BAR

CODE [U-42] 최신 보안패치 및 벤더 권고사항 적용

cat << EOF >> $result

[양호]: 패치 적용 정책을 수립하여 주기적으로 패치를 관리하고 있는 경우

[취약]: 패치 적용 정책을 수립하지 않고 주기적으로 패치관리를 하지 않는 경우

EOF

BAR

# Update package list
yum update -y

# Get list of installed packages
installed_packages=`yum list installed`

# Get list of packages to be removed
remove_list=`cat /path/to/package_list.txt`

# Loop through packages to be removed and remove them
for package in $remove_list; do
  yum remove -y $package
done

# Get list of packages to be installed
install_list=`cat /path/to/package_list.txt`

# Loop through packages to be installed and install them
for package in $install_list; do
  yum install -y $package
done

# Log updates applied
yum history > /var/log/updates.log

# 패치 관리 일정 정의
SCHEDULE= " 0 0 * * 1 "  # 매주 월요일 자정에 실행

# 로그 파일 생성
터치 /var/log/apache_patch_management.log

# Apache 패치 관리를 위한 cron 작업 추가
에코  " ${SCHEDULE} 루트 /usr/bin/apt 업데이트 -y >> /var/log/apache_patch_management.log 2>&1
${SCHEDULE} 루트 /usr/bin/apt 설치 --only-upgrade apache2 -y >> /var/log/apache_patch_management.log 2>&1
${SCHEDULE} 루트 /etc/init.d/apache2 재시작 >> /var/log/apache_patch_management.log 2>&1 "  | crontab -




# 패치 관리 일정 정의
SCHEDULE= " 0 0 * * 1 "  # 매주 월요일 자정에 실행

# 로그 파일 생성
터치 /var/log/mysql_patch_management.log

# MySQL 패치 관리를 위한 cron 작업 추가
에코  " ${SCHEDULE} 루트 /usr/bin/apt 업데이트 -y >> /var/log/mysql_patch_management.log 2>&1
${SCHEDULE} 루트 /usr/bin/apt 설치 --only-upgrade mysql-server -y >> /var/log/mysql_patch_management.log 2>&1
${SCHEDULE} 루트 /etc/init.d/mysql 재시작 >> /var/log/mysql_patch_management.log 2>&1 "  | crontab -




# 패치 관리 일정 정의
SCHEDULE= " 0 0 * * 1 "  # 매주 월요일 자정에 실행

# 로그 파일 생성
터치 /var/log/php_patch_management.log

# PHP 패치 관리를 위한 cron 작업 추가
에코  " ${SCHEDULE} 루트 /usr/bin/apt 업데이트 -y >> /var/log/php_patch_management.log 2>&1
${SCHEDULE} 루트 /usr/bin/apt 설치 --only-upgrade php -y >> /var/log/php_patch_management.log 2>&1
${SCHEDULE} 루트 /etc/init.d/php7.4-fpm 재시작 >> /var/log/php_patch_management.log 2>&1 "  | crontab -




cat $result

echo ; echo 

 
