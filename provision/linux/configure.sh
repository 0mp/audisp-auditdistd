#! /bin/sh -

required=
for dep in libssl-dev byacc flex auditd
do
    if ! dpkg-query -l "$dep" 1>/dev/null 2>&1
    then
        required="$required $dep"
    fi
done
if [ -n "$required" ]
then
    apt-get update
    apt-get -y install $required
fi

if ! grep ^auditdistd /etc/passwd 1>/dev/null
then
    useradd -m auditdistd
fi

distdir=/var/log/audit/auditdistd
mkdir -p "$distdir"
chmod 770 "$distdir"
chown auditdistd:root "$distdir"
