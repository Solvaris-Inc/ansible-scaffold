FROM ubuntu:24.04

LABEL org.opencontainers.image.source="https://github.com/Solvaris-Inc/ansible-scaffold"

ENV DEBIAN_FRONTEND=noninteractive
ENV ANSIBLE_COLLECTIONS_PATH=/usr/share/ansible/collections

# 1. Install System Packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ssh-client \
    sshpass \
    git \
    podman \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 2. Install Python Drivers (Inline)
RUN pip3 install --no-cache-dir --break-system-packages \
    ansible-core==2.16.3 \
    pywinrm \
    requests \
    google-auth \
    google-auth-oauthlib \
    python-hpilo

# 3. Install Ansible Collections (Inline)
RUN mkdir -p $ANSIBLE_COLLECTIONS_PATH && \
    ansible-galaxy collection install -p $ANSIBLE_COLLECTIONS_PATH \
    community.general \
    ansible.posix \
    containers.podman \
    ansible.windows \
    community.windows \
    google.cloud \
    hpe.ilo

WORKDIR /work
