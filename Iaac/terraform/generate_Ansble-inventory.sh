#!/bin/bash

echo "[jenkins]" > ../ansible/inventory.ini
terraform output -json | jq -r '.public_ips.value[0]' | \
  xargs -I{} echo "{} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa" >> ../ansible/inventory.ini

echo "[sonarqube]" >> ../ansible/inventory.ini
terraform output -json | jq -r '.public_ips.value[1]' | \
  xargs -I{} echo "{} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa" >> ../ansible/inventory.ini

echo "[docker]" >> ../ansible/inventory.ini
terraform output -json | jq -r '.public_ips.value[2]' | \
  xargs -I{} echo "{} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa" >> ../ansible/inventory.ini

