# Use an official Ubuntu image as the base image
FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and install PufferPanel
WORKDIR /opt
RUN curl -L -o pufferpanel.zip https://gitlab.com/pufferpanel/pufferpanel/-/jobs/artifacts/master/raw/build/pufferpanel.zip?job=build \
    && unzip pufferpanel.zip \
    && rm pufferpanel.zip

# Expose the necessary ports
EXPOSE 8080

# Start PufferPanel
CMD ["/opt/pufferpanel/pufferpanel"]
