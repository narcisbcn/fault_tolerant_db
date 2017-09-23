#!/bin/bash
# Description: Simple script to insert data

i=0

# Create table
mysql -u app_user  -h 127.0.0.1  -P6033  -Bse "create table if not exists my_database.t(id int)"

# Writting 
while true; do let i++; echo "INSERTING ${i}";  mysql -u app_user  -h 127.0.0.1  -P6033  -Bse "insert into my_database.t(id) values (current_timestamp(5))"; done
