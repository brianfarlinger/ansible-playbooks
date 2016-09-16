#!/bin/bash

pvehost=$1
hostname=$2
vmid=$4
password=$5
ram=$6
cpu=$7
disk=$8
ipv4=$9

pvesh create /nodes/$pvehost/openvz \
-vmid $vmid \
-hostname $hostname \
-storage local-lvm
-password $password \
-ostemplate local:vztmpl/ubuntu-10.04-standard_10.04-4_i386.tar.gz \
-memory $ram -swap 512 \
-disk $disk \
-cpus $cpu \
-ip_address $ipv4

pvesh create /nodes/$pvehost/openvz/$vmid/status/start
