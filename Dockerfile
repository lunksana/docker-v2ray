FROM alpine:latest
LABEL maintatiner="lunksana <zoufeng4@gmail.com>"

ENV V2_API="https://api.github.com/repos/v2ray/v2ray-core/releases/latest"
ENV V2_MOD="vmess"
ENV V2_NETWORK="tcp"
ENV V2_ID=value
ENV V2_SECURITY="auto"
ENV V2_ADS="0.0.0.0"
ENV V2_PORT=12345
ENV V2_ALTERID=64
ENV V2_PATH="/"
ENV V2_SECURITY_NET="tls"

RUN apk update && \
    apk upgrade

RUN apk add wget curl jq \
    && V2_VER="$(curl -s ${V2_API} | grep 'tag_name' | cut -d\" -f4)"  \
    && curl -L -H "Cache-Control: no-cache" -o "/tmp/v2ray.zip" "https://github.com/v2ray/v2ray-core/releases/download/${V2_VER}/v2ray-linux-64.zip" \
    && unzip /tmp/v2ray.zip \
    && cp /tmp/v2ray-${V2_VER}-linux-64/v2* /usr/bin \
#    osip=$(curl -4s https://api.ip.sb/ip)
    && 