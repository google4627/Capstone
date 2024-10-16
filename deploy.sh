#!/bin/bash
docker pull google4627/prod:latest
docker run -d -p 80:80 google4627/prod:latest
