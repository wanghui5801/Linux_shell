#!/bin/bash

# Enter the key
echo "Please enter the SSH public key (*.pub):"
read -r ssh_key

# Add key to /root/.ssh/authorized_keys
mkdir -p /root/.ssh
echo "$ssh_key" >>/root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chmod 700 /root/.ssh

# Change /etc/ssh/sshd_config PermitRootLogin to prohibit-password
if [ -f /etc/ssh/sshd_config ]; then
  sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
else
  echo "sshd_config file not found. Exiting."
  exit 1
fi

# Restart SSH
if command -v systemctl &>/dev/null; then
  systemctl restart sshd
elif command -v service &>/dev/null; then
  service ssh restart
else
  echo "Cannot determine how to restart SSH service. Please restart it manually."
  exit 1
fi

echo "Done"
