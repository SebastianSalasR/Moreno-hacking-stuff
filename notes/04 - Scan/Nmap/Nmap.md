---
tags:
  - scan
  - "#ports"
  - "#tools"
  - "#firewall"
  - "#vulnerabilities"
---
---
# Definition
> Nmap ("Network Mapper") is a free and open source utility for network discovery and security auditing. Many systems and network administrators also find it useful for tasks such as network inventory, managing service upgrade schedules, and monitoring host or service uptime. Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics. It was designed to rapidly scan large networks, but works fine against single hosts.

More information about this tool [here](https://nmap.org/)

---
# Explaining this command
### Basic use
Know the ports that are open in a host:
```shell
nmap -p22 192.168.111.1
```
