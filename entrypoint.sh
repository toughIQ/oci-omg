#!/bin/bash

set -x

/home/omg/.local/bin/omg use /home/omg/must-gather

exec "$@"