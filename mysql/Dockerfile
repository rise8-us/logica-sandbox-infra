FROM mysql:8.2.0
COPY ./schema-scripts/ /docker-entrypoint-initdb.d/
COPY ./healthcheck/wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh

