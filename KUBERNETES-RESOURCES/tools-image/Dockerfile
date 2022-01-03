FROM alpine

RUN apk update && \

# IP Routing Utilities
# https://pkgs.alpinelinux.org/package/edge/main/x86/iproute2
apk add iproute2 && \

# Connection tracking userspace tools
# org/package/v3.3/main/x86/conntrack-tools
apk add conntrack-tools && \

# The ISC DNS tools
# https://pkgs.alpinelinux.org/package/edge/main/x86/bind-tools
apk add bind-tools
