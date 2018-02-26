#!/usr/bin/env bash

set -e

echo "check svn install"
checkSvn=(which svn)
if [ $checkSvn != "" ]; then
    echo "svn installed!"
else
    echo "svn isn't installed!"
    exit 1
fi


echo "source download start"
svn checkout svn://gcc.gnu.org/svn/gcc/trunk gcc
echo "source download end!"

exit 0

