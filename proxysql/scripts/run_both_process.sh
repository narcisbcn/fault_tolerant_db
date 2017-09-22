#!/bin/bash

echo "Starting ProxySQL"
/etc/init.d/proxysql start 


echo "Starting Consul agent…"
/bin/consul agent -config-dir /config -join consul-server
