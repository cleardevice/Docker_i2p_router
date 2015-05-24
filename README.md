# Docker_i2p_router

A simple dockerized i2p router on Ubuntu 14.04.

Much of this is derived from [PrivacySolutions](https://github.com/PrivacySolutions/docker-i2p) implementation.

## Dependencies:

* Docker

## Usage

Build image: `docker build -t <image tag> .`
Run: `docker run -p 7657:7657 -p 4444:4444 -p 4445:4445 -p 7658:7658 i2p_router`

Point your browser to localhost:7657 for the console.

If you want to calibrate your router with your internet connection, enter the container `docker exec -it <container ID> bash` then `speedtest --bytes`. 
