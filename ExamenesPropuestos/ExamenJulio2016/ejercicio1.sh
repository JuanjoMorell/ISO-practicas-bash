#! /bin/bash -u

find $1 -type f -exec ls -l {} \; | tr -s " " | cut -f6 -d" " | sort | uniq -c
