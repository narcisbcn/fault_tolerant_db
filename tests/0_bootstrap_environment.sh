#!/bin/bash

SLEEPTIME=30

cd ../
echo "Stopping dockers..."
docker-compose down
if [[ $(docker ps -a -q) ]]; then
    echo "Removing containers..."
    docker rm -f $(docker ps -a -q)
fi
echo "Starting docker compose..."
docker-compose up -d
echo "Bootstraping MRM, waiting for MySQL instaces"
sleep ${SLEEPTIME}
docker exec -it mrm bash /docker-entrypoint-initdb.d/replication-bootstrap.sh
