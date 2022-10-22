#!/bin/bash

#set -o verbose

echo "======== CREATE ROLE TO POSTGRES"
psql -h postgres -Upostgres -c "CREATE USER optimus_post WITH PASSWORD '$1';"
psql -h postgres -Upostgres -c "ALTER ROLE optimus_post SUPERUSER CREATEDB;"
echo "======== MIGRATION DB"
rake db:setup db:migrate
echo "======== END"
