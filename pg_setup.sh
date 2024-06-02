yum -y install epel-release https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm postgresql12-server 
/usr/pgsql-12/bin/postgresql-12-setup initdb
systemctl enable postgresql-12
service postgresql-12 start
