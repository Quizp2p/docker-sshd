# SSH Tunnel

[![Docker Repository on Quay.io](https://quay.io/repository/macropin/sshd/status "Docker Repository on Quay.io")](https://quay.io/repository/macropin/sshd)

## Environment Options
- `REMOTE_SRV` set the remote server to connect to
## Usage Example
### docker-compose file for connecting to remote server
```
tunnel:
  image: daocloud.io/quiz42/dao-tunnel
  environment:
  - REMOTE_SRV=quiz@devop.heartleaves.com
  volumes:
  - /etc/ssh/dao/password.txt:/root/.ssh/password.txt
  net: host
```
