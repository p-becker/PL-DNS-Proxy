#!/bin/bash
set -e
proxy='http://185.46.212.91:80'

sudo tee -a ~/.bashrc <<EOF
source ~/wpi_root.bashrc
EOF

sudo tee -a ~/wpi_root.bashrc <<EOF
export HTTP_PROXY=$proxy
export HTTPS_PROXY=$proxy
EOF

sudo tee -a /etc/apt/apt.conf.d/proxy.conf <<EOF
Acquire {
	HTTP::proxy \"$proxy\";
	HTTPS::proxy \"$proxy\";
}
EOF

source ~/.bashrc
