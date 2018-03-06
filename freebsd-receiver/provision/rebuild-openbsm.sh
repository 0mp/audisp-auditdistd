#! /bin/sh -

set -e

cd /vagrant/freebsd-receiver/openbsm
make maintainer-clean || :
./configure
make
