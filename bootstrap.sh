#!/bin/bash
# Usage: curl -sSL https://raw.githubusercontent.com/Solvaris-Inc/ansible-scaffold/main/bootstrap.sh | bash

PROJECT_DIR="ansible-scaffold"

echo "--- Initializing Solvaris Ansible Scaffold ---"

# 1. Create and enter the project directory
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit

# 2. Setup internal folders
mkdir -p keys inventory playbooks

# 3. Download the launcher
curl -sSL "https://raw.githubusercontent.com/Solvaris-Inc/ansible-scaffold/main/ansible-run.sh" -o ansible-run.sh
chmod +x ansible-run.sh

# 4. Pull the image
echo "--- Pulling Scaffold Image from GHCR ---"
podman pull ghcr.io/solvaris-inc/ansible-scaffold:latest

echo "Setup complete. Move to the folder: cd $PROJECT_DIR"
echo "Then update your .env and run ./ansible-run.sh"
