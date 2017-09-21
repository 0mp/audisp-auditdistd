#! /bin/sh -

set -eu

confdir=/vagrant
key=auditdistd.key.pem
cert=auditdistd.cert.pem

[ -d /var/audit/remote ] || mkdir /var/audit/remote
chmod 0700 /var/audit/remote
chown auditdistd:wheel /var/audit/remote

cp "$confdir/auditdistd-receiver.conf" /etc/security/auditdistd.conf
chmod 0600 /etc/security/auditdistd.conf

cp "$confdir/$key" "/etc/security/$key"
cp "$confdir/$cert" "/etc/security/$cert"
chmod 0600 "/etc/security/$key" "/etc/security/$cert"
chown root:wheel "/etc/security/$key" "/etc/security/$cert"
