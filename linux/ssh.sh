#!/bin/bash

SSH_CONFIG="/etc/ssh/sshd_config"
cp $SSH_CONFIG "$SSH_CONFIG.backup"
echo "Port 2222" >> $SSH_CONFIG
echo "PermitRootLogin no" >> $SSH_CONFIG
echo "MaxAuthTries 3" >> $SSH_CONFIG
echo "PasswordAuthentication no" >> $SSH_CONFIG
echo "PubkeyAuthentication yes" >> $SSH_CONFIG
echo "HostKeyAlgorithms ecdsa-sha2-nistp521" >> $SSH_CONFIG
echo "KexAlgorithms ecdh-sha2-nistp521" >> $SSH_CONFIG
# Замените 'user1 user2' на реальные имена пользователей
echo "AllowUsers user1 user2" >> $SSH_CONFIG
systemctl restart sshd
echo "SSH configuration updated. Please connect using port 2222 with your SSH key."
