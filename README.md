
# OpenBabel Project Docker Setup

## Install Docker

Follow the tutorial [here](https://docs.rockylinux.org/gemstones/containers/docker/) to install Docker on Rocky Linux.

## Clone the Repository

```sh
git clone https://github.com/krishiv-g/align-it-ob3.git
cd align-it-ob3
```

## Build the Docker Image

```sh
docker build -t openbabel-project .
```

## Run the Docker Container

```sh
docker run -it openbabel-project tail -f /dev/null
```

## TU EXEC INSIDE CONTAINER 

```sh
docker exec -it suspicious_mayer /bin/bash
```
