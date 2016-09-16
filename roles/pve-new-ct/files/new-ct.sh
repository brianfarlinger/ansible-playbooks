#!/bin/bash

gateway=192.168.69.1
bridge='vmbr0'
nameserver='192.168.69.20,192.168.69.22,8.8.8.8'

pvehost=$1
hostname=$2
vmid=$4
ram=$5
cpu=$6
disk=$7
ipv4=$8
 
pvesh create /nodes/$pvehost/lxc \
-ostemplate NAS1:vztmpl/centos-7-default_20160205_amd64.tar.xz \
-vmid $vmid \
-hostname $hostname \
-storage local-lvm \
-rootfs $disk \
-memory $ram \
-swap 512 \
-net0 name=eth0,ip=$ipv4/24,gw=$gateway,bridge=$bridge \
-nameserver $nameserver

pvesh create /nodes/$pvehost/lxc/$vmid/status/start
