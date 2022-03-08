
#!/bin/bash
# Run this once: docker buildx create --use --name build --node build --driver-opt network=host
# Run this once: 
docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t solidus1983/pihole-unbound:`cat VERSION` --push .
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t solidus1983/pihole-unbound:latest --push .
