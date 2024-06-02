# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

# Install necessary packages including CMake
RUN apt-get update && apt-get install -y \
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
    libbz2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the OpenBabel directory into the container
COPY openbabel-openbabel-3-1-1 /openbabel/openbabel-openbabel-3-1-1

# Copy the build script into the container
COPY build.sh /build.sh

# Copy the remaining project files into the container
COPY . /align-it-ob3

# Make the build script executable
RUN chmod +x /build.sh

# Run the build script
RUN /build.sh

# Set the working directory
WORKDIR /align-it-ob3

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
