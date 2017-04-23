FROM alpine:latest

MAINTAINER Quiz Zhu <quizzhu@gmail.com>

RUN apk update && \
    apk add bash git openssh rsync sshpass&& \
    mkdir -p ~root/.ssh /etc/authorized_keys && chmod 700 ~root/.ssh/ && \
    rm -rf /var/cache/apk/*

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]

#CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]

# ssh -N -R 8070:localhost:8070 quiz@devop.heartleaves.com
#CMD ["/usr/bin/ssh", "-N", "-R", "8070:localhost:8070", "$REMOTE_SRV"]

#CMD ["echo Hello Quiz!"]