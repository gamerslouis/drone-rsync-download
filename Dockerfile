FROM alpine:3.13

RUN apk add --no-cache --update ca-certificates bash openssh-client rsync
COPY download.sh /usr/local/

RUN chmod +x /usr/local/download.sh

ENTRYPOINT ["/usr/local/download.sh"]
