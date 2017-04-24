FROM alpine:latest

MAINTAINER Andrew Cutler <andrew@panubo.com>

RUN apk update && \
    apk add bash git openssh rsync && \
    mkdir -p ~root/.ssh /etc/authorized_keys && chmod 700 ~root/.ssh/ && \
    sed -i -e 's@^AuthorizedKeysFile.*@@g' /etc/ssh/sshd_config  && \
    echo -e "AuthorizedKeysFile\t.ssh/authorized_keys /etc/authorized_keys/%u" >> /etc/ssh/sshd_config && \
    echo -e "Port 2222\n" >> /etc/ssh/sshd_config && \
    cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/cache/apk/*

# No need to expose ports when using as a tunnel
EXPOSE 2222

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
