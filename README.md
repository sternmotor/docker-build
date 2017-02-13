# docker-build

This project houses a template build directory for setting up a docker image for server containers. Server containers may be a little more complex inside than usual application containers.
Therefore, a command-line handler script for executing docker container actions like `help`, `start`, `stop`is prepared. This script is meant to act as init system and first-time-initialisation script.

The `Dockerfile` itself is adapted for serving the mentioned start script.

Furthermore, a license file and a readme file are prepared.
