#!/bin/sh
set -o errexit

dir="/root/openvpn"
auth="$dir/passwd"
conf="$dir/server.ovpn"
mkdir -p /dev/net
[[ -c /dev/net/tun ]] || mknod -m 0666 /dev/net/tun c 10 200
[[ -e $conf ]] || { echo "ERROR: VPN not configured!"; sleep 120; }
[[ -e $cert ]] || { echo "ERROR: VPN CA cert missing!"; sleep 120; }
iptables -t nat -A POSTROUTING -o tun+ -d 192.168.1.0/24 -j MASQUERADE
exec sg vpn -c "openvpn --cd $dir --config $conf --auth-user-pass $auth"