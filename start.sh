#!/bin/sh

#获取服务器IP
osip=$(curl -4s https://api.ip.sb/ip)
#自动生成UUID
uuid=$(cat /proc/sys/kernel/random/uuid)

