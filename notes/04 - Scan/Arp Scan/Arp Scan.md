---
tags:
  - bash
  - discovery
  - scan
  - "#hosts"
---
---
# Definition
>**arp-scan** sends ARP request packets to the specified hosts and displays any responses received. The network interface can be specified with the **--interface** option. If no interface is specified, **arp-scan** will pick the lowest numbered, configured up interface (excluding loopback).

See more information [here](https://man-archlinux-org.translate.goog/man/arp-scan.1.en?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc)

---
Example to identify the hosts in a network:
```shell
arp-scan -I wlan0 --localnet 
```
This is very similar to the `-sn` parameter of [[Nmap]]
