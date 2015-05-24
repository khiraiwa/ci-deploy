#!/bin/bash -x

USER=${SERVER_USER}
HOST=${SERVER_HOST}
MSPASSWD=${PASSWD}

text=$(ssh ${USER}@${HOST} "docker ps | grep -e docker-mysql")
arr=(`echo $text`)
docker exec ${arr[0]} mysqldump -u root p ${MSPASSWD} -x --all-databases > dump.sql

