#!/bin/bash
# Usage: curl -sSL https://raw.githubusercontent.com/Solvaris-Inc/ansible-scaffold/main/bootstrap.sh | bash

echo "--- Initializing Solvaris Ansible Scaffold ---"

# 1. Setup local folders
mkdir -p keys inventory playbooks

# 2. Download the launcher from the main branch
curl -sSL "https://raw.githubusercontent.com/Solvaris-Inc/ansible-scaffold/main/ansible-run.sh" -o ansible-run.sh
chmod +x ansible-run.sh

# 3. Pull the image
echo "--- Pulling Scaffold Image from GHCR ---"
podman pull ghcr.io/solvaris-inc/ansible-scaffold:latest

echo "Setup complete. Update your .env and run ./ansible-run.sh"
