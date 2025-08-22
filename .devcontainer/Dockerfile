FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install only the essentials
RUN apt-get update && apt-get install -y \
    firefox \
    novnc websockify \
    x11vnc xvfb \
    fluxbox \
    wget curl git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a default non-root user
RUN useradd -m devuser && echo "devuser:devuser" | chpasswd && adduser devuser sudo
USER devuser
WORKDIR /home/devuser
