#! /bin/sh -

apt-get update
apt-get -y install libssl-dev byacc flex

if ! grep ^auditdistd /etc/passwd
then
    useradd -m auditdistd
fi
mkdir -p /var/log/audit/dist
chmod 770 /var/log/audit/dist
chown auditdistd:root /var/log/audit/dist
