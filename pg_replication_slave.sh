systemctl stop postgresql-12
rm -rf /var/lib/pgsql/12/data
pg_basebackup -R -h 10.131.0.26 -U replica_user -D /var/lib/pgsql/12/data -P
chown postgres -R /var/lib/pgsql/12/data
systemctl start postgresql-12