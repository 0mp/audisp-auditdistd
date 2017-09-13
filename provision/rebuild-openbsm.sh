#! /bin/sh -

set -e

cd /shared/openbsm
make maintainer-clean || :
./configure
make
