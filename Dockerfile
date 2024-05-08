FROM rust:1.78 AS builder

WORKDIR /usr/src/myapp

COPY . .

RUN cargo install --path .

FROM debian:12

COPY --from=builder /usr/local/cargo/bin/myapp /usr/local/bin/myapp

CMD ["myapp"]