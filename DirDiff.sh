#!/bin/bash

### Script for excluding .git  directory while comparing two directiories with vim DirDiff
### Scipts invoked with alias
### alias vd='/usr/local/bin/DirDiff.sh'

if [ "$#" -ne 2 ]; then
            echo "You must provide two arguments with different directory names to compare"
    else

        tempDir="/tmp/DirDiff"
        mkdir -p ${tempDir}


        mkdir ${tempDir}/$1
        mkdir ${tempDir}/$2

        mv ${1}/.git ${tempDir}/$1
        mv ${2}/.git ${tempDir}/$2


        vim -c "DirDiff $1 $2"

        mv  ${tempDir}/$1/.git   ${1}/ && rmdir ${tempDir}/$1
        mv  ${tempDir}/$2/.git   ${2}/ && rmdir ${tempDir}/$2
fi
