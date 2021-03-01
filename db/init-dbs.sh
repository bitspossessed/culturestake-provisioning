#!/bin/bash

set -e

DATABASES=(
  $POSTGRES_DATABASE_GRAPH_NODE
  $POSTGRES_DATABASE_MAIN
)

if [[ $ENV == "development" ]]
then
  DATABASES+=($POSTGRES_DATABASE_TEST)
fi

create_database () {
  DB_NAME=$1

  echo "Create postgres database '$DB_NAME'"

  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE $DB_NAME TEMPLATE template_postgis;
    GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $POSTGRES_USER;
EOSQL
}

# Create all necessary databases
for db in "${DATABASES[@]}"
do
  create_database $db
done
