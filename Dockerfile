FROM haproxy:alpine
LABEL Maintainer="sbw <sbw@sbw.so>" \
      Description="HAProxy with shadowsocks checker"

# change mirror
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk --update add \
        python3 \
        py3-ipaddress \
        openssl \
    && rm -rf /var/cache/apk/*

ADD haproxy-shadowsocks-checker.py /usr/bin
