#!/bin/bash
# Run this once: docker buildx create --use --name build --node build --driver-opt network=host
docker buildx build --platform linux/amd64 -t solidus1983/pihole-unbound:`cat VERSION` --push .
docker buildx build --platform linux/amd64 -t solidus1983/pihole-unbound:latest --push .


