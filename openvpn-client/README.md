#simple openvpn client

## example in code
```
remote ip 192.168.1.0/24
authfile  passwd
ovpnfile  server.ovpn
docker run -d --cap-add=NET_ADMIN --device /dev/net/tun --restart=always --name vpn  openvpn-client:0.1
```