#!/bin/bash

action=$1
envr=$2

error="Please add proper parameters, i.e. './auto.sh run develop' or './auto.sh stop actual'.\n"

if [ "$envr" = "develop" ]; then
   cp develop.yml docker-compose.yml
elif [ "$envr" = "actual" ]; then
   cp actual.yml docker-compose.yml
else
   printf "$error" && exit 1
fi

if [ "$action" = "run" ]; then
   echo Starting web automation containers...
   docker-compose --project-name auto up -d
elif [ "$action" = "stop" ]; then
   echo Stopping web automation containers...
   docker stop $(docker ps -q --filter "name=auto_")
   #docker rm $(docker ps -q --filter "name=auto_" --filter "status=exited")
else
   printf "$error" && exit 1
fi

echo --- WEB AUTOMATION CONTAINER STATUS ---
docker ps --filter "name=auto_"
rm docker-compose.yml
