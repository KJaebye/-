#!/bin/bash
# Launch an experiment using the docker gpu image

set -x

cmd_line="$@"

echo "Executing in the docker (gpu image):"
echo $cmd_line

MOUNT_DIR=$(pwd)/astool

# access any device get host display
xhost +

docker run -it --gpus=all --rm \
    -v ${MOUNT_DIR}:/root/astool \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -e GDK_SCALE \
    -e GDK_DPI_SCALE \
    astool:latest \
    bash -c "cd astool && $cmd_line"