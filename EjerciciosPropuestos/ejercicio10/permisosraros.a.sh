#! /bin/bash -u

find $1 -type f \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%p %M\n"  
