POSTGRES_PASSWORD=$1
REPLICA_PASSWORD=$2

sudo -u postgres psql -c "ALTER USER postgres PASSWORD '$POSTGRES_PASSWORD';"
sudo -u postgres psql -c "CREATE ROLE replica_user WITH REPLICATION LOGIN PASSWORD '$REPLICA_PASSWORD';"
sudo -u postgres psql -c "\du"

cp {pg_hba.conf,postgresql.conf} /var/lib/pgsql/12/data/
systemctl restart postgresql-12