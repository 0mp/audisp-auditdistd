# audisp-auditdistd

Pushing audit logs from Linux over to FreeBSD using auditdistds.

## Usage

### First set up

```sh
./generate-auditdistd-conf
./do-vagrant-up
./do-provision
vagrant provision linux-sender --provision-with build-openbsm
```

### Run auditdistds

```sh
vagrant provision freebsd-receiver --provision-with run
vagrant provision linux-sender --provision-with run
```

### Detatils

There are 3 machines:

* freebsd-receiver
* freebsd-sender
* linux-sender

The goal is to make linux-sender work flawlessly with freebsd-receiver.

freebsd-sender is here for debugging purposes.

## Dependencies

- `rsync`
- `vagrant`
