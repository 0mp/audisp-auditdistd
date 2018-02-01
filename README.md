# audisp-auditdistd

Pushing audit logs from Linux over to FreeBSD using auditdistds.

## Usage

### Set up

```sh
./generate-auditdistd-conf
./do-vagrant-up
./do-provision
```

### Run auditdistds

```sh
vagrant provision freebsd --provision-with run
vagrant provision linux --provision-with run
```

## Dependencies

- `rsync`
- `vagrant`
