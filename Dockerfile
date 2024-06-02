# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

# Copy the build script into the container
COPY build.sh /build.sh

# Make the build script executable
RUN chmod +x /build.sh

# Run the build script
RUN /build.sh

# Set the working directory
WORKDIR /align-it-ob3

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
