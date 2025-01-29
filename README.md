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

## Docker Images for ROS 2 Jazzy per Deepseek R1

The following tags refer to different Docker images for ROS 2 Jazzy distributions, hosted on the OSRF (Open Source Robotics Foundation) Docker Hub repository. Below is a breakdown of their differences:

---

### `osrf/ros:jazzy-simulation`

- **Purpose**: Tailored for simulation tasks in ROS 2 Jazzy.
- **Contents**: Includes ROS 2 Jazzy core packages and simulation tools (e.g., Gazebo).
- **Use Case**: Running ROS 2 simulations without a full desktop environment.

---

### `osrf/ros:jazzy-simulation-noble`

- **Purpose**: Similar to `jazzy-simulation`, but built on **Ubuntu Noble (24.04)**.
- **Contents**: ROS 2 Jazzy simulation tools on an Ubuntu Noble base.
- **Use Case**: ROS 2 Jazzy simulations on Ubuntu Noble.

---

### `osrf/ros:jazzy-desktop`

- **Purpose**: Provides a ROS 2 Jazzy desktop environment.
- **Contents**: Core ROS 2 Jazzy packages, GUI tools, and libraries.
- **Use Case**: General ROS 2 development with GUI support.

---

### `osrf/ros:jazzy-desktop-noble`

- **Purpose**: Similar to `jazzy-desktop`, but built on **Ubuntu Noble (24.04)**.
- **Contents**: ROS 2 Jazzy desktop tools on an Ubuntu Noble base.
- **Use Case**: ROS 2 Jazzy desktop development on Ubuntu Noble.

---

### `osrf/ros:jazzy-desktop-full`

- **Purpose**: Full ROS 2 Jazzy desktop environment with additional packages.
- **Contents**: Everything in `jazzy-desktop` plus a comprehensive set of ROS 2 tools.
- **Use Case**: Complete ROS 2 development environment.

---

### `osrf/ros:jazzy-desktop-full-noble`

- **Purpose**: Similar to `jazzy-desktop-full`, but built on **Ubuntu Noble (24.04)**.
- **Contents**: Full ROS 2 Jazzy environment on an Ubuntu Noble base.
- **Use Case**: Comprehensive ROS 2 Jazzy development on Ubuntu Noble.

---

## Key Differences

### Base OS

- **Default**: Images without `noble` use the default Ubuntu version for ROS 2 Jazzy.
- **Ubuntu Noble**: Images with `noble` are based on **Ubuntu 24.04**.

### Functionality

- **Simulation**: Includes tools like Gazebo for simulation workflows.
- **Desktop**: Adds GUI tools for desktop development.
- **Desktop-Full**: Provides the most complete set of ROS 2 packages.

### Use Cases

- Choose based on:
  - Required tools (simulation, desktop, or full development).
  - Preferred OS (default Ubuntu or Ubuntu Noble).

---

For more details, visit the [OSRF Docker Hub repository](https://hub.docker.com/r/osrf/ros/tags).
