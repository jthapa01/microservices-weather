#!/bin/bash
set -e

aws ecr get-login-password --region us-east-1 --profile weather-ecr-agent | docker login --username AWS --password-stdin 663843113144.dkr.ecr.us-east-1.amazonaws.com
docker build -f ./Dockerfile -t cloud-weather-temperature:latest .
docker tag cloud-weather-temperature:latest 663843113144.dkr.ecr.us-east-1.amazonaws.com/cloud-weather-temperature:latest
docker push 663843113144.dkr.ecr.us-east-1.amazonaws.com/cloud-weather-temperature:latest
