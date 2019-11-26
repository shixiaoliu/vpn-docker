#simple openvpn client

## example in code
```
remote ip 192.168.1.0/24
authfile  passwd
ovpnfile  server.ovpn
docker run -d --cap-add=NET_ADMIN --device /dev/net/tun --restart=always --name vpn  openvpn-client:0.1

```

   +------------------------------------------------+
   |                                                |
   |                                                |
   |   iptables -t nat -A POSTROUTING -o docker0 -d 192.168.1.0/24 -j MASQUERADE
   |                                                |
   |                                                |
   +----------------+-------------------------------+
                    ^
                    |
                    |
                    |
                    |
+-------------+     |    +----------------+       +--------------+
|             |     |    |                |       |              |
|   host      +-----+--->+   vpn docker   +------>+   remote server
|             |          |                |       |              |
+-------------+          +----------------+       +--------------+

