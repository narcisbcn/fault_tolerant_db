#!/bin/bash

mysql -u app_user  -proot -h 127.0.0.1  -P6033  -Bse "use my_database; create table if not exists t(id int)"
while true; do mysql -u app_user  -proot -h 127.0.0.1  -P6033  -Bse "use my_database; insert into t(id) values (current_timestamp(5))"; done