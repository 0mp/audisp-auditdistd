#! /bin/sh -

auditdistd=/vagrant/linux-sender/openbsm/bin/auditdistd/auditdistd
config=/vagrant/auditdistd-configs/auditdistd-linux-sender.conf

"$auditdistd" -c "$config" -F -dddddddddddd
