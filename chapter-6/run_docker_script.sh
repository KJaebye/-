#!/bin/bash
# Launch an experiment using the docker gpu image

set -x

cmd_line="$@"

echo "Executing in the docker (gpu image):"
echo $cmd_line

MOUNT_DIR=$(pwd)/NerveNet

sudo docker run -it --gpus=all --rm \
    -v ${MOUNT_DIR}:/root/NerveNet \
    0dc641d172a5 \
    bash -c "source /root/miniconda3/etc/profile.d/conda.sh && conda activate nervenet && cd /root/NerveNet/tool/ && $cmd_line"