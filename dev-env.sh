#!/bin/bash
CONTAINER_NAME=esp-blinky-dev

docker run -it --entrypoint /bin/bash -e USER=$USER -v ./app:/app  esp-blinky-dev
