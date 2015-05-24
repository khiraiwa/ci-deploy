#!/bin/bash -x

USER=${SERVER_USER}
HOST=${SERVER_HOST}
MSPASSWD=${PASSWD}

text=$(ssh ${USER}@${HOST} "docker ps | grep -e docker-mysql")
arr=(`echo $text`)
ssh ${USER}@${HOST} "docker exec ${arr[0]} /usr/bin/mysqldump -u root -p\"${MSPASSWD}\" -x --all-databases > dump.sql"
ssh ${USER}@${HOST} "mv dump.sql /data_mysql/" 

ssh ${USER}@${HOST} "cd /home/khiraiwa/compose-myserver;docker-compose stop"
ssh ${USER}@${HOST} "cd /home/khiraiwa/compose-myserver;docker-compose up -d"

text=$(ssh ${USER}@${HOST} "docker ps | grep -e docker-mysql")
arr=(`echo $text`)

ssh ${USER}@${HOST} "docker exec ${arr[0]} /usr/bin/mysqladmin -u root password \"${MSPASSWD}\""
ssh ${USER}@${HOST} "docker exec ${arr[0]} mysql -u root -p\"${MSPASSWD}\" < /data_mysql/dump.sql"

ssh ${USER}@${HOST} "cd /home/khiraiwa/compose-myserver;docker-compose stop;docker-compose start"


