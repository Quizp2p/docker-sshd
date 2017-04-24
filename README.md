# SSH Tunnel

[![Docker Repository on Quay.io](https://quay.io/repository/macropin/sshd/status "Docker Repository on Quay.io")](https://quay.io/repository/macropin/sshd)

## Environment Options
- `REMOTE_SRV` set the remote server to connect to
- `REMOTE_PORT` set the listenning port on remote server
- `LOCAL_PORT` set the local listenning port to bind
## Usage Example
### docker-compose file for connecting to remote server
```
tunnel:
  image: daocloud.io/quiz42/dao-tunnel
  environment:
  - REMOTE_SRV=quiz@devop.heartleaves.com
  - REMOTE_PORT=8070
  - LOCAL_PORT=8070
  volumes:
  - /etc/ssh/dao/password.txt:/root/.ssh/password.txt
  net: host
```
