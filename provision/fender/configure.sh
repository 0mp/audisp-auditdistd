#! /bin/sh -

distdir=/var/audit/dist
mkdir -m 0770 -p "$distdir"
chown auditdistd:root "$distdir"
