#! /bin/bash -u

ls -l | grep -o "[1-9][0-9]*" | sort -n | tail -1
