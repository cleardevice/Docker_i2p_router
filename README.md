# Docker_i2p_router

A simple dockerized i2p router on Ubuntu 14.04.3

## Dependencies:

* Docker

## Usage

Run: `docker run --rm -p 7657:7657 -p 4444:4444 -p 4445:4445 -p 7658:7658 -p 6668:6668 johnwesley/i2prouter`

Use the following [tutorial](https://geti2p.net/en/about/browser-config) to configure your browser, then ppint to `localhost:7657` for the i2p-console.

If you want to calibrate your router with your internet connection, enter the container `docker exec -it <container ID> bash` then `speedtest --bytes`. 
From there, you can use the information to adjust your i2p connection.
