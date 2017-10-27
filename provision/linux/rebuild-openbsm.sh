#! /bin/sh -

set -e

cd /vagrant/openbsm
make maintainer-clean || :
./configure
make
