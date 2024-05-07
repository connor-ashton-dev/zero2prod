# pick the rust version for the base image
FROM rust:1.77.2

# this means `cd app` basically
WORKDIR /app

# Install the dependencies for the linking configuration
RUN apt update && apt install lld clang -y

# Copy all the files from our working env to the docker image. `COPY <src> <dest>`
COPY . .

# Build that shiz. --release to make it fast
RUN cargo build --release


# when `docker run` is executed, launch the binary
ENTRYPOINT [ "./target/release/zero2prod" ]
