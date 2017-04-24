#!/usr/bin/env bash

set -e

[ "$DEBUG" == 'true' ] && set -x


# Generate private key and copy it to server
echo -e 'y/n'|ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa -q
sshpass -f /root/.ssh/password.txt ssh-copy-id -o StrictHostKeyChecking=no $SSH_SRV -p $SSH_PORT

# Connect to remote server
ssh -N -R $REMOTE_PORT:127.0.0.1:$LOCAL_PORT $SSH_SRV -p $SSH_PORT


