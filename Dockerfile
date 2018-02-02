FROM alpine:latest
LABEL maintatiner="lunksana <zoufeng4@gmail.com>"
RUN apk update && \
    apk upgrade

RUN apk add wget curl && \
    V2_VER="$(curl -s https://api.github.com/repos/v2ray/v2ray-core/releases/latest | grep 'tag_name' | cut -d\" -f4)" && \
    curl -L -H "Cache-Control: no-cache" -o "/tmp/v2ray.zip" "https://github.com/v2ray/v2ray-core/releases/download/${V2_VER}/v2ray-linux-64.zip" && \
    osip=$(curl -4s https://api.ip.sb/ip) && \
