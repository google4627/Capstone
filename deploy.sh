#!/bin/bash
docker pull google4627/dev:latest
docker run -d -p 80:80 google4627/dev:latest
