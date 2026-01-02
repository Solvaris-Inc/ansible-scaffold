#!/bin/bash
# Solvaris Ansible Scaffold Launcher

IMAGE_NAME="ghcr.io/solvaris-inc/ansible-scaffold:latest"

# Load local .env secrets if they exist
if [ -f .env ]; then 
    export $(grep -v '^#' .env | xargs)
fi

# Ensure terminal is interactive for prompts
INTERACTIVE_FLAG="-it"
[ ! -t 0 ] && INTERACTIVE_FLAG="-t"

echo "--- [Solvaris Scaffold] Running: ansible-playbook $@ ---"

podman run --rm ${INTERACTIVE_FLAG} --privileged \
  --env-file <(env | grep -E 'GOOGLE_|ANSIBLE_|VYOS_|PROXMOX_') \
  -v "$(pwd)":/work:Z \
  -v ~/.ssh:/root/.ssh:ro \
  -v /run/user/$(id -u)/podman/podman.sock:/run/podman/podman.sock:Z \
  ${IMAGE_NAME} \
  ansible-playbook "$@"
