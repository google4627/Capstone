#!/bin/bash
IMAGE_NAME="google4627/sample-website"
IMAGE_TAG="latest"
CONTAINER_NAME="sample-website"

docker pull $IMAGE_NAME:$IMAGE_TAG

if [[ $(docker ps -q -f name=$CONTAINER_NAME) ]]; then
    echo "Stopping existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

echo "Deploying the Docker container..."
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME:$IMAGE_TAG

if [[ $(docker ps -q -f name=$CONTAINER_NAME) ]]; then
    echo "Deployment successful! Application is running on port 80."
else
    echo "Deployment failed."
    exit 1
fi

