#!/bin/bash

# Enter the key
echo "Please enter the ssh public key(*.pub):"
read -r ssh_key

# add key to  /root/.ssh/authorized_keys 中
mkdir -p /root/.ssh
echo "$ssh_key" >>/root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chmod 700 /root/.ssh

# Change /etc/ssh/sshd_config PermitRootLogin to prohibit-password
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

# Restart SSH
systemctl restart sshd

echo "Done"
