#!/bin/bash

# Exit on any error
set -e

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $@"
}

# Variables
OPENBABEL_DIR="/openbabel/openbabel-openbabel-3-1-1"
INSTALL_PREFIX="/usr/local"

# Install necessary packages
log "Installing necessary packages..."
apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    vim \
    sudo \
    libeigen3-dev \
    zlib1g-dev \
    libxml2-dev \
    libboost-all-dev \
    libssl-dev \
    make \
    cmake \
    openbable \
    libbz2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Build and install OpenBabel
log "Building and installing OpenBabel..."
mkdir -p /openbabel/build
cd /openbabel/build
cmake ${OPENBABEL_DIR} -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
make
make install

# Build and install align-it
log "Building and installing align-it..."
cd /align-it-ob3
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_PREFIX_PATH=${INSTALL_PREFIX}/lib/cmake/openbabel3 ..
make
make install

log "Build and installation complete!"
