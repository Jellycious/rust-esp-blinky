#!/bin/sh
docker run -it --entrypoint /bin/bash -e USER=$USER -v ./app:/app  esp-blinky-dev
