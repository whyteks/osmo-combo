#!/bin/bash

REPOS=`cat .gitmodules | grep path | cut -d'=' -f2-`
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <patch_dir_name>"
    exit 1
fi
mkdir -p patches/$1 || exit -1

for i in $REPOS; do
    echo Processing $i
    ( cd $i ; git diff > ../patches/$1/$i.patch )
done
