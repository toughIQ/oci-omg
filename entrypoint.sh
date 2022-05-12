#!/bin/bash

set -x

eval "$(omg completion bash)"

/home/omg/.local/bin/omg use /home/omg/must-gather

exec "$@"
