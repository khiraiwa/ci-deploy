#!/bin/bash -x

USER=${SERVER_USER}
HOST=${SERVER_HOST}
MSPASSWD=${PASSWD}

text=$(ssh ${USER}@${HOST} "docker ps | grep -e docker-mysql")
arr=(`echo $text`)
ssh ${USER}@${HOST} "docker exec ${arr[0]} /usr/bin/mysqldump -u root -p\"ME09rebR\" -x --all-databases > dump.sql"
ssh ${USER}@${HOST} "dump.sql /data_mysql/" 

