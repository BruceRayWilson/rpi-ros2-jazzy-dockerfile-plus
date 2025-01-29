# README

Follow me on YouTube [BruceRayWilson](https://www.youtube.com/channel/UCYkXxe6CGAHwopdYC8l5A1Q).

## Background

This is a ROS2 Jazzy update to [Josh Newans's dockerfile-example repo](https://github.com/joshnewans/dockerfile_example) and the [OSRF Docker images](https://github.com/osrf/docker_images) were also used for inspiration.

See Josh's ROS2 Humble video at [Crafting your Dockerfile (Docker and Robotics Pt 3)](https://www.youtube.com/watch?v=RbP5cARP-SM).

## Updates

- feat: Document exec.sh usage for second terminal access as root user
- Updated the "Usage" section to reflect the current versions of `build.sh` and `run.sh`
- fix: Add Python venv setup and activation in Dockerfile and .bash_aliases
- feat: Add I2C support and Adafruit dependencies to Dockerfile
- feat: Add USERNAME env var and workspace directory navigation
- Fixed bug in .bash_aliases.
- feat: Add ROS2 workspace directory to Dockerfile
- feat: Add bash-completion and python3-argcomplete packages
- build: Add ROS development tools and Gazebo packages to Dockerfile
- feat: Add .bash_aliases to container user's home directory

Virtually all the changes were made using (Aider, R1, and Claude 3.5 Sonnet):
aider --model openrouter/deepseek/deepseek-r1 --architect --editor-model claude-3-5-sonnet-20241022

## Usage

### Building the Docker Image

To build the Docker image, run:

```bash
./build.sh
```

You can pass `--no-cache` as an argument to rebuild the image without using Docker's cache:

```bash
./build.sh --no-cache
```

### Running the Docker Container

To run the Docker container, execute:

```bash
./run.sh
```
