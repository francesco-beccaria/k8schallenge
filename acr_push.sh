#!/bin/bash

# get ACR name
ACR=$(az acr show --name Team3ACR | jq -r .loginServer)

# pull containers
docker-compose pull

# docker tagging
docker tag shanepeckham/captureorderack:v3 $ACR/shanepeckham/captureorderack:v3
docker tag shanepeckham/fulfillorderack:v3 $ACR/shanepeckham/fulfillorderack:v3
docker tag shanepeckham/rabbitmqlistenerack:v3 $ACR/shanepeckham/rabbitmqlistenerack:v3
docker tag rabbitmq:3-management $ACRmongo/rabbitmq:3-management
docker tag mongo:jessie $ACRmongo/mongo:jessie

# docker pushing to ACR
docker push $ACR/shanepeckham/captureorderack:v3
docker push $ACR/shanepeckham/fulfillorderack:v3
docker push $ACR/shanepeckham/rabbitmqlistenerack:v3
docker push $ACRmongo/rabbitmq:3-management
docker push $ACRmongo/mongo:jessie
