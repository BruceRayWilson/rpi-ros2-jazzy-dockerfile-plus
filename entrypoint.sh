#!/bin/bash

set -e

source /opt/ros/jazzy/setup.bash

cd "/home/${USERNAME}/ros2_ws"

echo "Provided arguments: $@"

sudo chmod 666 /dev/i2c-1

exec $@
