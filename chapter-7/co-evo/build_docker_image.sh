#!/bin/bash

set -x

cd astool/docker/
docker build -t 'astool:latest' .