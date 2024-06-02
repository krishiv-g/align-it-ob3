#!/bin/bash

# Exit on any error
set -e

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $@"
}

# Variables
OPENBABEL_VERSION="3.1.1"
OPENBABEL_URL="https://github.com/openbabel/openbabel/archive/refs/tags/openbabel-3-1-1.tar.gz"
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
    openbabel \
    libbz2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and install OpenBabel
log "Downloading OpenBabel..."
wget ${OPENBABEL_URL} -O openbabel-${OPENBABEL_VERSION}.tar.gz

log "Extracting OpenBabel..."
tar -zxf openbabel-${OPENBABEL_VERSION}.tar.gz

log "Building and installing OpenBabel..."
mkdir -p /openbabel-${OPENBABEL_VERSION}/build
cd /openbabel-${OPENBABEL_VERSION}/build
cmake ../openbabel-${OPENBABEL_VERSION} -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
make
make install

# Build and install align-it
log "Building and installing align-it..."
mkdir -p /align-it-ob3/build
cd /align-it-ob3/build
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_PREFIX_PATH=${INSTALL_PREFIX}/lib/cmake/openbabel3 ..
make
make install

log "Build and installation complete!"
