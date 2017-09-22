sysbench oltp.lua \
--oltp-table-size=1000000 \
--mysql-db=my_database \
--mysql-user=app_user \
--mysql-password=root 
--mysql-host=127.0.0.1 
--mysql-port=6033 
--db-driver=mysql 
prepare

sysbench oltp.lua \
--oltp-table-size=1000000 \
--mysql-db=my_database \
--mysql-user=app_user \
--mysql-password=root 
--mysql-host=127.0.0.1 
--mysql-port=6033 
--db-driver=mysql 
run