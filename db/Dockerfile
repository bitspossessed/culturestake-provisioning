FROM postgres:12.2-alpine

# Used when no existing database on postgres volume, including first initialization.
# See: https://github.com/docker-library/docs/blob/master/postgres/README.md#initialization-scripts
COPY ./init-dbs.sh /docker-entrypoint-initdb.d/
