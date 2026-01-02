#!/bin/bash
# Solvaris-Inc: Image Publishing Script
# This script automates the building, tagging, and uploading of the 
# ansible-scaffold container to the GitHub Container Registry (GHCR).

# 1. Variables
IMAGE_NAME="ghcr.io/solvaris-inc/ansible-scaffold:latest"

echo "--- STARTING PUBLISH PROCESS ---"

# 2. Build the image locally
# This uses the Dockerfile in the current directory (.)
echo "--- Step 1: Building image ${IMAGE_NAME} ---"
podman build -t "${IMAGE_NAME}" .

# 3. Authenticate with GitHub
# Note: This will prompt for your GitHub Username and Personal Access Token (PAT).
# Ensure your PAT has 'write:packages' and 'read:packages' permissions.
echo "--- Step 2: Authenticating with ghcr.io ---"
podman login ghcr.io

# 4. Push the image to the registry
echo "--- Step 3: Pushing image to GHCR ---"
podman push "${IMAGE_NAME}"

echo "--- PUBLISH COMPLETE ---"
echo "Your container is now available at: ${IMAGE_NAME}"
