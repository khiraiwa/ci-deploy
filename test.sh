#!/bin/bash -x

USER=${SERVER_USER}
HOST=${SERVER_HOST}
PASSWD=${PASSWD}

echo ${USER}
echo ${HOST}
echo ${PASSWD}

#text=$(ssh ${USER}@${HOST} "docker ps | grep -e docker-mysql")
#docker exec ${arr[0]} mysqldump -u root p ${MSQL_PSWD} -x --all-databases > dump.sql
