# Use the official Rust image as the base image
FROM rust:1.86-bullseye AS builder

# Set the working directory
WORKDIR /app

# Copy the Cargo.toml and Cargo.lock files
COPY Cargo.toml Cargo.lock ./

# Copy the source code
COPY src ./src

# Build the application in release mode
RUN cargo build --release

# Use a minimal base image with a newer glibc version for the final stage
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /app/target/release/pdtracker_rust ./

# Expose the port the application runs on
EXPOSE 3000

# Command to run the application
CMD ["./pdtracker_rust"]