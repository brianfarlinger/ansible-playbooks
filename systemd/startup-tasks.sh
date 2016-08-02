#!/bin/bash

#add ldap users to groups
gpasswd -a brian wheel
gpasswd -a backup qemu
