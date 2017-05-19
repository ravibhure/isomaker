#!/bin/sh

# determine ubuntu version
ubuntu_version=$(lsb_release -cs)
PROV="{{provisioner}}"
# Post os install setup
sed -i '/floppy/d' /etc/fstab

DSDA=$(fdisk -l /dev/sda | grep Disk | grep sda | awk '{print $3}' | cut -d'.' -f1)
# Adding fstab
cp /etc/fstab /etc/fstab.orig
awk -v OFS='\t' '!/^#/ && ($2 != "swap") && ($2 == "/tmp") { if(!match(/nodev/, $4)) $4="nodev,nosuid" } ; ($2 == "/home") { if(!match(/nodev/, $4)) $4="nodev" } 1' /etc/fstab >> /tmp/fstab
echo "none\t/run/shm\ttmpfs\trw,nosuid,nodev,noexec\t0\t0" >> /tmp/fstab
echo "/tmp\t/var/tmp\tnone\trw,bind\t0\t0" >> /tmp/fstab
cp /tmp/fstab /etc/fstab

apt-get update ;
if [ $PROV == "chef" ] ;then
  # Install Chef solo
  curl -L https://www.opscode.com/chef/install.sh | bash
if [ $PROV == "puppet" ] ;then
  # Install Puppet agent
  curl -L https://gist.githubusercontent.com/ravibhure/e110ddf6d85e2069b4690791b3c89e00/raw/67968d443eaaa1a8fcd71dbf82f3a371038e43f1/install_puppet.sh | bash
elif [ $PROV == "ansible" ] ;then
  # Install Ansible
  curl -L https://gist.githubusercontent.com/ravibhure/3bc92132dbff8143df248087c3911617/raw/bf4de1493513133570562f59eefb7e0686bd8ddf/bootstrap_ansible_node.sh | bash
else
  # Default is Ansible
  curl -L https://gist.githubusercontent.com/ravibhure/3bc92132dbff8143df248087c3911617/raw/bf4de1493513133570562f59eefb7e0686bd8ddf/bootstrap_ansible_node.sh | bash
fi
