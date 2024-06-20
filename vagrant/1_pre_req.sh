#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -y 
sudo apt install ntp resolvconf -y
sudo systemctl start ntp
sleep 5
mkdir -p /etc/resolvconf/resolv.conf.d/
sudo touch /etc/resolvconf/resolv.conf.d/base
sudo echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/base
sudo echo "nameserver 8.8.4.4" >> /etc/resolvconf/resolv.conf.d/base
resolvconf -u
sudo resolvconf -u
sudo apt-get install --fix-missing
sleep 5
sudo apt install make net-tools sudo wget nano telnet acl nginx -y
sleep 5

mkdir -p /vagrant/IMPORTANTDETAILS/
machineip=`ip -4 addr show dev eth1 | grep inet | awk '{print $2}' | cut -d/ -f1` || true
echo "$machineip" > /vagrant/IMPORTANTDETAILS/machineip.txt || true

echo "URL details:
APICOMBINED:http://"$machineip"/
VULNAPI1:http://"$machineip":8081/
VULNAPI2:http://"$machineip":7171/
JVL:http://"$machineip":8080/JavaVulnerableLab/
" > /vagrant/IMPORTANTDETAILS/VULNURLS.txt

cp -f /vagrant/openapifiles/scanning-openapi.yml /vagrant/IMPORTANTDETAILS/scanning-openapi.yml
cp -f /vagrant/openapifiles/secure-openapi.yml /vagrant/IMPORTANTDETAILS/secure-openapi.yml
sed -i "s/\[REPLACEIP\]/$machineip/g" /vagrant/IMPORTANTDETAILS/scanning-openapi.yml