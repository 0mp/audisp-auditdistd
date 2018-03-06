#! /bin/sh -

set -e

cd /vagrant/freebsd-sender/openbsm
make maintainer-clean || :
./configure
make
