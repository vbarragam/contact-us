	sudo apt-get update
    sudo apt-get install -y postgresql-9.3
    sudo mv /etc/postgresql/9.3/main/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf.backup
    sed "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf.backup > /etc/postgresql/9.3/main/postgresql.conf
    sudo echo "host  all  all  10.0.2.0/24  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
    sudo service postgresql restart
    sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres'; "
    sudo -u postgres createdb -E UTF8 help-me
