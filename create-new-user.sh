#!/bin/sh
# get user
user=$1
full_name=$2
password=$3

# Controlla se la password è vuota, altrimenti genera una password casuale
if [ -z "$password" ]; then
  # Genera una password sicura con lettere, numeri e simboli speciali (16 caratteri)
  password=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+{}|:<>?=,./;' < /dev/urandom | head -c16)
  echo "Generated secure password for $user: $password"
else
  echo "Using provided password for $user"
fi

echo "Creating new user: $user"

# Add user, set full name, home directory, and shell without interaction
sudo useradd -m -d "/home/$user" -s /bin/bash -c "$full_name" "$user"

# Set password without interaction
echo "$user:$password" | sudo chpasswd

# Add user to the sudo group
sudo usermod -aG sudo "$user"

echo "User $user created with full name: $full_name and password: $password"
