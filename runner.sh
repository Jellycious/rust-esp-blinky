#!/bin/bash


RELEASE=app/target/xtensa-esp32-none-elf/release/blinky
DEBUG=app/target/xtensa-esp32-none-elf/debug/blinky

TARGET=$DEBUG

CONTAINER_NAME=esp-blinky-dev

CARGO_FLAGS=""

if [[ $2 == "--release" ]]; then
    TARGET=$RELEASE
    CARGO_FLAGS="--release"
fi;


if [[ -z $1 ]]; then
    # Build
    docker run -it -e USER=$USER -v ./app:/app $CONTAINER_NAME bash -c "source ~/export-esp.sh; cargo build $CARGO_FLAGS"
    espflash flash --monitor $TARGET
    exit 0
fi;

# Build target
if [[ $1 == "build" ]]; then
    docker run -it -e USER=$USER -v ./app:/app $CONTAINER_NAME bash -c "source ~/export-esp.sh; cargo build $CARGO_FLAGS"
    exit 0
fi;

# Flash target
if [[ $1 == "flash" ]]; then
    espflash flash --monitor $TARGET
    exit 0
fi;


# Flash ESP device
