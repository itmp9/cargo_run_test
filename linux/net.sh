#!/bin/bash

NEW_INTERFACE="eth1"
STATIC_IP="192.168.1.100"
NETMASK="24"
GATEWAY="192.168.1.1"

echo "auto $NEW_INTERFACE" | sudo tee -a /etc/network/interfaces
echo "iface $NEW_INTERFACE inet static" | sudo tee -a /etc/network/interfaces
echo "address $STATIC_IP" | sudo tee -a /etc/network/interfaces
echo "netmask $NETMASK" | sudo tee -a /etc/network/interfaces
echo "gateway $GATEWAY" | sudo tee -a /etc/network/interfaces

echo "auto eth0" | sudo tee -a /etc/network/interfaces
echo "iface eth0 inet dhcp" | sudo tee -a /etc/network/interfaces

sudo systemctl restart networking.service

echo "Network interfaces have been configured."
