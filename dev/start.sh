#!/bin/bash
docker stop dev
docker rm dev
docker build -t dev .
docker run -p 6666-6668:6666-6668 -v $(pwd):/root/workspaces/dev -t dev
sleep 10
