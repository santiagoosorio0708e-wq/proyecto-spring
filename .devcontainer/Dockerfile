FROM mcr.microsoft.com/devcontainers/java:17-bullseye

# Instalar utilidades adicionales si es necesario
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client
