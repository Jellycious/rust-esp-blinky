# syntax=docker/dockerfile:'

FROM espressif/idf-rust:esp32_latest

WORKDIR /app

USER 0
RUN apt-get update
RUN apt-get install vim -y

COPY ./app /app
RUN chown -R 1000:1000 /app

USER 1000

# Install cargo-generate
RUN cargo install cargo-generate

# Build project to cache dependencies
RUN bash -c "source /home/esp/export-esp.sh && \
    cargo build && \
    cargo build --release"

