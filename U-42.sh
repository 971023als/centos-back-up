#!/bin/bash

 

. function.sh 
   

BAR

CODE [U-42] 최신 보안패치 및 벤더 권고사항 적용

cat << EOF >> $result

[양호]: 패치 적용 정책을 수립하여 주기적으로 패치를 관리하고 있는 경우

[취약]: 패치 적용 정책을 수립하지 않고 주기적으로 패치관리를 하지 않는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

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




# Update system packages
yum update -y

# Check current Apache version
httpd -v

# Set Apache patching policy
# Example: only apply security-related patches
PATCH_POLICY="security"

# Check for available Apache patches
yum list available "httpd*" --disablerepo="*" --enablerepo="updates" | grep $PATCH_POLICY

# Apply patches
yum update -y "httpd*" --disablerepo="*" --enablerepo="updates" --security

# Restart Apache service
systemctl restart httpd




# Update system packages
yum update -y

# Check current MySQL version
mysql --version

# Set MySQL patching policy
# Example: only apply security-related patches
PATCH_POLICY="security"

# Check for available MySQL patches
yum list available "mysql*" --disablerepo="*" --enablerepo="updates" | grep $PATCH_POLICY

# Apply patches
yum update -y "mysql*" --disablerepo="*" --enablerepo="updates" --security

# Restart MySQL service
systemctl restart mysqld



# Update system packages
yum update -y

# Check current PHP version
php -v

# Set PHP patching policy
# Example: only apply security-related patches
PATCH_POLICY="security"

# Check for available PHP patches
yum list available "php*" --disablerepo="*" --enablerepo="updates" | grep $PATCH_POLICY

# Apply patches
yum update -y "php*" --disablerepo="*" --enablerepo="updates" --security

# Restart Apache service
systemctl restart httpd





cat $result

echo ; echo 

 
