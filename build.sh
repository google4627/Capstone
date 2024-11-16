#!/bin/bash
IMAGE_NAME="google4627/sample-website"
IMAGE_TAG="latest"
echo "Building Docker image. .."
docker build -t $IMAGE_NAME:$IMAGE_TAG .
if [[ $? -eq 0 ]]; then
    echo "Docker image built successfully: $IMAGE_NAME:$IMAGE_TAG"
else
    echo "Docker image build failed."
    exit 1
fi
