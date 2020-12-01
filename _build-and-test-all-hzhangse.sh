#! /bin/bash

set -e

dockerdb="./gradlew ${DATABASE}${MODE}dbCompose"
dockerall="./gradlew ${DATABASE}${MODE}Compose"

#./gradlew :eventuate-tram-examples-in-memory:cleanTest :eventuate-tram-examples-in-memory:test
echo ${dockerall} ${dockerdb}
${dockerall}Down -i
${dockerall}Build -i
${dockerdb}Up -i

./wait-for-${DATABASE}.sh

${dockerall}Up

./wait-for-services.sh $DOCKER_HOST_IP 8099
#./gradlew :eventuate-tram-examples-jdbc-${BROKER}:cleanTest :eventuate-tram-examples-jdbc-${BROKER}:test

#${dockerall}Down
