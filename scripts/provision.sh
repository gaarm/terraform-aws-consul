#!/bin/sh
apt-get update -y
apt-get install -y zip unzip
wget https://releases.hashicorp.com/consul/CONSUL_VERSION/consul_CONSUL_VERSION_linux_amd64.zip
unzip consul_CONSUL_VERSION_linux_amd64.zip
chown root:root consul
mv consul /usr/local/bin/
useradd --system --home /etc/consul.d --shell /bin/false consul
mkdir --parents /opt/consul
chown --recursive consul:consul /opt/consul
mkdir --parents /etc/consul.d
mv /tmp/server.hcl /etc/consul.d
chown --recursive consul:consul /etc/consul.d
chmod 640 /etc/consul.d/server.hcl
