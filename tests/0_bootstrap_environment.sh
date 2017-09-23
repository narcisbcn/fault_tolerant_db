#!/bin/bash

SLEEPTIME=30

cd ../
echo "Stopping dockers..."
docker-compose down
if [[ $(docker ps -a -q) ]]; then
    echo "Removing containers..."
    docker rm -f $(docker ps -a -q --filter "name=consul-server" --filter "name=mrm" --filter "name=mysql-" --filter "name=proxysql")
fi
echo "Starting docker compose..."
docker-compose up -d
echo "Bootstraping MRM, waiting for MySQL instaces"
sleep ${SLEEPTIME}
docker exec -it mrm bash /docker-entrypoint-initdb.d/replication-bootstrap.sh
