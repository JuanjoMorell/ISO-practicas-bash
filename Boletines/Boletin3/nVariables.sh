#!/bin/bash -u

echo "El primer argumento es $1"
i=$#
echo "El ultimo argumento es ${!i}"
