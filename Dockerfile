# Small (929.78)
# FROM arm64v8/ros:jazzy-perception
FROM arm64v8/ros:jazzy-perception-noble

ENV BLINKA_FORCEBOARD=RASPBERRY_PI_5
ENV BLINKA_FORCECHIP=BCM2XXX

# Example of installing programs
RUN apt-get update \
    && apt-get install -y \
    nano \
    vim \
    python3-pip \
    python3-venv \
    python3-colcon-common-extensions \
#    ros-jazzy-gazebo-* \
    bash-completion \
    python3-argcomplete \
#    i2c-tools \
    python3-smbus \
    && rm -rf /var/lib/apt/lists/*


# Install Adafruit CircuitPython libraries
RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir adafruit-blinka adafruit-circuitpython-lsm303dlh-mag RPi.GPIO

# Example of copying a file
# COPY config/ /site_config/

# Create a non-root user
ARG USERNAME=ubuntu
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV USERNAME=$USERNAME

RUN mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config
RUN mkdir /home/$USERNAME/ros2_ws && chown $USER_UID:$USER_GID /home/$USERNAME/ros2_ws

COPY .bash_aliases /home/${USERNAME}/.bash_aliases
RUN chown ${USER_UID}:${USER_GID} /home/${USERNAME}/.bash_aliases

COPY compass.py /home/${USERNAME}/ros2_ws/compass.py
RUN chown ${USER_UID}:${USER_GID} /home/${USERNAME}/ros2_ws/compass.py

# Set up sudo
RUN apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && usermod -aG i2c $USERNAME \
  && rm -rf /var/lib/apt/lists/*


# Copy the entrypoint and bashrc scripts so we have 
# our container's environment set up correctly
COPY entrypoint.sh /entrypoint.sh
# <deleted>COPY bashrc /home/${USERNAME}/.bashrc </deleted>


# Set up entrypoint and default command
#ENTRYPOINT [<deleted>"/bin/bash", </deleted>"/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
