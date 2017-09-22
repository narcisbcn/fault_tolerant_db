MySQL: fault tolerance platform
===================
----------


Overview
-------------
This is a docker-compose stack built for a presentation done at PerconaLive Dublin 2017: [LINK](https://www.percona.com/live/e17/sessions/fault-tolerance-platform-with-proxysql-consul-and-mrm)

This docker compose will spin up several dockers:

* MRM
* ProxySQL and consul agent
* 3 MySQL 
* Consul Server

The aim of this presentation is to show how we built a fault tolerance database architecture at Letgo, using technologies such as ProxySQL + Consul + Replication Manager and Puppet.

The idea of that talk was to explain how is possible to use a highly available platform using those described technologies. ProxySQL will route read and write queries, consul will ensure ProxySQL nodes are available and replication manager will handle failovers if the master goes down.



Bootstrapping
-------------
1.- docker-compose up (it takes around to 30 seconds)
2.- docker exec -it mrm bash /docker-entrypoint-initdb.d/replication-bootstrap.sh ( set up MySQL replicas)

Or: execute the *tests/0_bootstrap_environment.sh* script


Docker images 
-------------
Name     | Description
-------- | ---
Mariadb | Official one
MRM  | Dockerfile provided where you can change the version and config file
Consul-server | Dockerfile provided where you can change the version and config file
ProxySQL | Dockerfile provided where you can change the version and config file


Consul Server
-------------
This URL http://127.0.0.1:8500/ allows you to see the cluster status

MRM
-------------
You can find the MRM  dashboard here: http://127.0.0.1:10001


### Diagram

```sequence
proxysql -> mysql_master: writes (HG0) - check read_only=0
proxysql ->  mysql_slave_X: reads (HG1)- check read_only=1
MRM -> mysql_master: sets (read_only=0)
MRM -> mysql_slave_X: sets (read_only=1)
```

