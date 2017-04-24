# SSHD

[![Docker Repository on Quay.io](https://quay.io/repository/macropin/sshd/status "Docker Repository on Quay.io")](https://quay.io/repository/macropin/sshd)

Minimal Alpine Linux Docker container with `sshd` exposed and `rsync` installed.

Mount your .ssh credentials (RSA public keys) at `/root/.ssh/` in order to
access the container via root ssh or mount each user's key in
`/etc/authorized_keys/<username>` and set `SSH_USERS` config to create user accounts (see below).

Optionally mount a custom sshd config at `/etc/ssh/`.

## Environment Options

- `SSH_USERS` list of user accounts and uids/gids to create. eg `SSH_USERS=www:48:48,admin:1000:1000`
- `MOTD` change the login message

## Usage Example
### docker-compose file for connecting to remote server
```
tunnel-door:
  image: daocloud.io/quiz42/dao-tunnel-door
  volumes:
  - /etc/ssh/dao/id_rsa.pub:/root/.ssh/authorized_keys
  - /etc/ssh/dao/password.txt:/root/.ssh/password.txt
  net: host
```
or

```
docker run -d -p 2222:22 -v /secrets/id_rsa.pub:/root/.ssh/authorized_keys -v /mnt/data/:/data/ macropin/sshd
```

or

```
docker run -d -p 2222:22 -v $(pwd)/id_rsa.pub:/etc/authorized_keys/www -e SSH_USERS="www:48:48" macropin/sshd
```
