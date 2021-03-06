#!/bin/bash

fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
echo 'vm.swappiness=10' |tee -a /etc/sysctl.conf
echo 'vm.vfs_cache_pressure=50' |tee -a /etc/sysctl.conf
