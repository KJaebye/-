#!/bin/bash
# Launch an experiment using the docker gpu image

set -x

cmd_line="$@"

echo "Executing in the docker (gpu image):"
echo $cmd_line

MOUNT_DIR=$(pwd)/Transform2Act

# access any device get host display
xhost +

docker run -it --gpus=all --rm \
    -v ${MOUNT_DIR}:/root/Transform2Act \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -e GDK_SCALE \
    -e GDK_DPI_SCALE \
    t2a:latest \
    bash -c "cd Transform2Act && $cmd_line"