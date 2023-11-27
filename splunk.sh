#! /bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo mkdir /opt/splunk
sudo chown -R ubuntu:ubuntu /opt/splunk/
wget -O /home/ubuntu/splunk-9.0.1-82c987350fde-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.0.1/linux/splunk-9.0.1-82c987350fde-Linux-x86_64.tgz"
tar -xzvC /opt -f /home/ubuntu/splunk-9.0.1-82c987350fde-Linux-x86_64.tgz
sudo chown -R ubuntu:ubuntu /opt/splunk/
cat <<EOT >> /opt/splunk/etc/system/local/user-seed.conf
[user_info]
USERNAME = admin
PASSWORD = password
EOT
cp /opt/splunk/etc/splunk-launch.conf.default /opt/splunk/etc/splunk-launch.conf
echo -e "\nSPLUNK_HOME=/opt/splunk" >> /opt/splunk/etc/splunk-launch.conf
sudo /opt/splunk/bin/splunk enable boot-start -user ubuntu
/opt/splunk/bin/splunk start --accept-license
