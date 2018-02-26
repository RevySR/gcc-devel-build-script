#!/usr/bin/env bash

set -e

echo "update source start"
cd gcc
svn up
cd -
echo "update source end!"

exit 0
