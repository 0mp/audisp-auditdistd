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
mkdir -p /var/log/audit/dist
chmod 770 /var/log/audit/dist
chown auditdistd:root /var/log/audit/dist
