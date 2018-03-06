#! /bin/sh -

confdir=/vagrant/auditdistd-configs

cp "$confdir/auditdistd-freebsd-sender.conf" /etc/security/auditdistd.conf
chmod 0600 /etc/security/auditdistd.conf

distdir=/var/audit/dist
mkdir -m 0770 -p "$distdir"
chown auditdistd:wheel "$distdir"
