#!/bin/bash
# Cloud PC auto-setup: launches Windows 10 (dockurr/windows) in Docker.
set -e
echo "Waiting for Docker..."
until docker info >/dev/null 2>&1; do sleep 3; done
mkdir -p /tmp/win-data
KVM_ARGS=""
if [ -e /dev/kvm ]; then KVM_ARGS="--device=/dev/kvm"; echo "KVM found: fast mode"; else echo "No KVM: compatibility mode (slower)"; fi
if ! docker ps -a --format '{{.Names}}' | grep -q '^cloudpc$'; then
  docker run -d --name cloudpc --restart unless-stopped \
    -e VERSION="10" \
    -e RAM_SIZE="4G" \
    -e CPU_CORES="2" \
    -e DISK_SIZE="32G" \
    -p 8006:8006 -p 3389:3389 \
    --device=/dev/net/tun --cap-add NET_ADMIN $KVM_ARGS \
    -v /tmp/win-data:/storage \
    dockurr/windows:latest
  echo "Windows container created and starting."
else
  docker start cloudpc >/dev/null 2>&1 || true
  echo "Windows container restarted."
fi
echo "Watch progress with: docker logs -f cloudpc"
