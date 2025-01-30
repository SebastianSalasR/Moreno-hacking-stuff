---
tags:
  - "#nmap"
  - scan
  - "#discovery"
  - ports
---
---
### p and top-ports
This parameter is used to specify which [[Ports|port]] or **range of ports** you want to **scan**. IE:
- Specifying only the port 22
```shell
nmap -p22 192.168.111.1
```
- Specifying the well known ports range
```shell
nmap -p1-1023 192.168.111.1
```
- Scan all the ports
```shell
nmap -p- 192.168.111.1
```
- Scan the x most common ports
```shell
nmap --top-ports 100 192.168.111.1
```
---
### open
- Only show the ports that are open
```shell
nmap --top-ports 100 --open 192.168.111.1
```
---
### n
- Deactivate [[DNS]] resolution
```shell
nmap -p- -n 192.168.111.1
```
This could be useful because sometimes you waste a lot of time in this procedure when it's not necessary.

---
### T
- The `-T<0-5>`[^1] parameter is used to set timing template
```shell
nmap -p- -T5 -n 192.168.111.1
```
This is basically how fast you want the scan to go.

---
### sT: Connect scan
The `-sT` option in Nmap performs a **TCP Connect Scan**, which is the default scan method when run without root privileges. It works by completing the full three-way handshake (SYN, SYN-ACK, ACK) for each port being tested. Key points about `-sT`:

- **Mechanism**: Establishes a full TCP connection with the target port.
- **Use Case**: Used when raw socket access (required for other scan types like SYN scans) is not available.
- **Advantages**: Reliable and doesn't require special privileges.
- **Disadvantages**: Slower and more detectable compared to SYN scans because it completes the connection.

This scan is helpful for identifying open ports when stealth is not a concern.

Example:
```shell
nmap -p- -sT --open -v -n 192.168.1.15
```

---
### Pn: No Host Discovery

The `-Pn` option in **Nmap** skips the host discovery phase, treating all specified targets as if they are online. This forces **Nmap** to directly perform port scans on the target(s), even if they don’t respond to ping requests. Key points about `-Pn`:

- **Mechanism**: Disables ping scans (ICMP, TCP, or ARP) and proceeds directly to port scanning.
- **Use Case**: Useful for scanning hosts behind firewalls or those configured to block ping requests.
- **Advantages**: Ensures scanning of targets that might otherwise be skipped due to lack of ping responses.
- **Disadvantages**: Can be slower, as Nmap will attempt to scan all targets, even if they are offline, but this depends on how the `-p` parameter is configured. 

This option is helpful for ensuring all targets are scanned in environments where ping-based host detection is unreliable.

Example:
```shell
nmap -p- -T5 --open -v -n -Pn 192.168.1.15
```
---
### sU: UDP Scan

The `-sU` option in Nmap performs a **UDP Scan**, which identifies open UDP ports on the target system by sending UDP packets to specified ports and analyzing the responses. Key points about `-sU`:

- **Mechanism**: Sends UDP packets to each target port. Open ports usually don't respond, while closed ports may reply with an ICMP "port unreachable" message.
- **Use Case**: Used to discover services running over UDP, such as DNS, SNMP, or DHCP.
- **Advantages**: Essential for auditing UDP-based services and uncovering vulnerabilities on non-TCP services.
- **Disadvantages**:
    - Slower than TCP scans due to the stateless nature of UDP.
    - Prone to false positives or negatives due to firewalls, rate-limiting, or dropped packets.

This scan is ideal for environments requiring comprehensive analysis, including both TCP and UDP services.

My recommendation is to read the man as it gives a lot more info. 

Example:
```shell
nmap --top-ports 100 --open -sU -v -n -Pn 192.168.1.15
```