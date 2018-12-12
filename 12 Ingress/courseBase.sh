#!/usr/bin/env bash
HOST_IP=$(echo $SSH_CONNECTION | awk '{print $3}')
sed -i "s/HOST_IP/${HOST_IP}/g" ~/ingress.yaml
