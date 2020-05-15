#!/bin/bash
set -e
proxy=$1

if [[ -z "$proxy" ]]; then
  echo "Usage: $0 proxyAdress"
  exit 1
fi

customRcString='source ~/wpi_root.bashrc'
# Append this line if it doesn't exist yet
grep -qxF "$customRcString" ~/.bashrc || echo "$customRcString" >> ~/.bashrc
sudo tee -a ~/.bashrc <<EOF
EOF

sudo tee ~/wpi_root.bashrc <<EOF
export HTTP_PROXY=$proxy
export HTTPS_PROXY=$proxy
EOF

sudo tee /etc/apt/apt.conf.d/proxy.conf <<EOF
Acquire {
	HTTP::proxy "http://$proxy";
	HTTPS::proxy "http://$proxy";
}
EOF
