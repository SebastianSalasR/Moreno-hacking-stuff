---
tags:
  - "#nmap"
  - scan
  - "#discovery"
  - ports
  - "#firewall"
  - "#evasion"
  - "#stealth"
---
---
### -p and top-ports
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
### -open
- Only show the ports that are open
```shell
nmap --top-ports 100 --open 192.168.111.1
```
---
### -n
- Deactivate [[DNS]] resolution
```shell
nmap -p- -n 192.168.111.1
```
This could be useful because sometimes you waste a lot of time in this procedure when it's not necessary.

---
### -T
- The `-T<0-5>`[^1] parameter is used to set timing template
```shell
nmap -p- -T5 -n 192.168.111.1
```
This is basically how fast you want the scan to go.

---
### -sT: Connect scan
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
### -Pn: No Host Discovery

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
### -sU: UDP Scan

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
---
### -sn: Host Discovery (No Port Scan)

The `-sn` option in Nmap performs a **host discovery scan**, checking which hosts are online without scanning for open ports. It is similar to **arp-scan**, as both are used to detect active devices on a network. Key points about `-sn`:

- **Mechanism**: Sends ICMP Echo Requests (ping), TCP SYN packets to common ports (like 80), or ARP requests (on local networks) to determine if a host is up.
- **Use Case**: Used when you only need to map live hosts without performing a full port scan.
- **Advantages**:
    - Faster than a full scan since it doesn’t probe individual ports.
    - Useful for network discovery and inventory tasks.
- **Disadvantages**:
    - Can be blocked by firewalls that filter ICMP and TCP SYN probes.
    - Unlike `arp-scan`, which exclusively uses ARP requests on local networks, `-sn` can also use other discovery methods.

This option is ideal for quickly identifying active hosts while minimizing network footprint.

Example:
```shell
nmap -sn 192.168.1.0/24
```
---
### -sV: Service Version Detection

The `-sV` option in Nmap enables **service version detection**, identifying the exact applications and versions running on open ports. This helps determine not just that a port is open, but what software is providing the service. Key points about `-sV`:

- **Mechanism**: Sends specially crafted probes to open ports and analyzes the responses to determine the software and version.
- **Use Case**: Used for security assessments, penetration testing, and network auditing to identify outdated or vulnerable services.
- **Advantages**:
    - Provides detailed information about running services.
    - Can help detect misconfigurations or outdated software.
- **Disadvantages**:
    - Can be slower than a basic port scan.
    - Some services may not respond accurately or may block fingerprinting attempts.

This option is essential for gaining deeper insights into network services beyond just open ports.

Example:
```shell
nmap -p22,80 -sV 192.168.1.15
```
---
### -f: Fragment Packets for Evasion

The `-f`[^2] option in Nmap enables **packet fragmentation**, splitting the scan packets into smaller fragments to evade detection by firewalls and intrusion detection systems (IDS). Key points about `-f`:

- **Mechanism**: Breaks TCP packets into multiple small fragments, making it harder for some security tools to reassemble and analyze them.
- **Use Case**: Used in stealth scans to bypass firewall rules or evade IDS that rely on signature-based detection.
- **Advantages**:
    - Helps avoid detection by simple packet filtering mechanisms.
    - Can be combined with other stealth options for enhanced evasion.
- **Disadvantages**:
    - May be ineffective against modern firewalls and IDS that perform packet reassembly.
    - Can cause network instability or scanning errors if the target system drops fragmented packets.

This option is useful for penetration testing but should be used cautiously to avoid scan failures or triggering security defenses.

Example:
```shell
nmap -p22,80 -f 192.168.1.15
```
---
### --mtu: Custom Packet Size for Evasion

The `--mtu` option in Nmap allows you to **set a custom maximum transmission unit (MTU)** for scan packets, which can be used to evade detection by firewalls and IDS. Key points about `--mtu`:

- **Mechanism**: Adjusts the size of packets to a specified multiple of the given MTU value, fragmenting packets in a way that may bypass security filters.
- **Use Case**: Used in stealth scans to avoid detection or to test how a network handles non-standard packet sizes.
- **Advantages**:
    - Provides more control over packet fragmentation than `-f`.
    - Can help evade simple packet inspection mechanisms.
- **Disadvantages**:
    - Ineffective against security systems that perform packet reassembly.
    - Incorrect values can lead to packet loss or unreliable scanning results.

This option is useful for fine-tuned stealth scans but requires testing to ensure proper functionality.
Example:
```shell
nmap -p22,80 --mtu 8 192.168.1.15
```
---
### -D: Decoy Scan for Anonymity and Evasion

The `-D` option in Nmap enables **decoy scanning**, which makes it appear as if multiple IPs are scanning the target instead of just one. This technique is useful for **hiding the real attacker's identity** by mixing their traffic with fake scanner sources.

#### 🔹 **How It Works**

When using `-D`, Nmap:

1. Sends **SYN** packets from your real IP **and** from fake decoy IPs.
2. The target replies with **SYN-ACK** packets to **all** the IPs in the list.
3. The real scanner can either complete the connection or drop the response to stay hidden.

#### 🛠️ **Example Usage**

```bash
nmap -D 192.168.1.10,192.168.1.11,ME,192.168.1.12 target.com
```

- `ME` represents your **real** IP.
- The target sees scan traffic coming from **multiple sources**, making it hard to identify the real scanner.
- If an IDS (Intrusion Detection System) logs the scan, it will record all decoy IPs, making attribution difficult.

## Enhancing Stealth with `-sS`: SYN Scan

Using `-sS` (SYN scan) with `-D` provides extra stealth by **never completing the TCP handshake**.

#### 🔹 **Why Use `-sS` Instead of the Default Scan?**

- In a normal **TCP Connect Scan (`-sT`)**, your system **completes the handshake**, making detection easier.
- In a **SYN Scan (`-sS`)**, Nmap:
    1. Sends a **SYN** packet.
    2. If the port is **open**, the server responds with **SYN-ACK**.
    3. Instead of sending an **ACK**, Nmap **drops the connection**, keeping the scan stealthy.

#### 🛠️ **Example Usage**

```bash
nmap -sS -D 192.168.1.10,192.168.1.11,ME,192.168.1.12 target.com
```

- This combines **decoy scanning** and **SYN scanning** for extra stealth.
- The target **cannot tell which host actually initiated the scan** since no connection is completed.

## 🔥 **Avoiding Detection Further: Blocking SYN-ACK Responses**

To ensure your machine never accidentally completes a connection (revealing itself), you can block incoming **SYN-ACKs**:

```bash
iptables -A INPUT -p tcp --sport 80 --tcp-flags SYN,ACK SYN,ACK -j DROP
```

- This prevents **your system from responding** to SYN-ACKs.
- The target might retry sending **SYN-ACKs**, but your machine **won’t acknowledge them**.

## ✅ **Advantages of This Technique**

✔ **Hides the real attacker's IP** by blending scan traffic with decoys.  
✔ **Prevents detection** by avoiding full TCP handshakes (`-sS`).  
✔ **Can be combined** with packet fragmentation (`-f`) or custom MTU (`--mtu`) for further evasion.

## ❌ **Disadvantages**

✖ Some security tools use **active SYN filtering** to detect and ignore fake SYN packets.  
✖ If the decoy IPs belong to real systems, they may send **RST packets**, disrupting the scan.  
✖ Firewalls that track **multiple SYNs from unrelated IPs** may still flag the scan as suspicious.

## 🔍 **Final Thoughts**

Using **`-D`** with **`-sS`** and blocking **SYN-ACKs** makes it much harder for a target to detect and trace your scans. This is a powerful stealth technique for penetration testing.

---
# --data-length: Modify Packet Size to Evade Detection

The `--data-length` option in Nmap **adds extra random data to probe packets**, changing their total size. This technique helps evade intrusion detection systems (IDS) and firewalls that rely on **signature-based detection** of typical scan traffic.

## 🔹 **How It Works**

By default, Nmap sends **minimal-sized packets** to keep scans efficient. However, some security systems identify Nmap scans by looking for **predictable packet sizes**. Adding random data:

1. **Alters the packet structure**, making it harder to recognize.
2. **Increases scan noise**, potentially bypassing simple IDS rules.
3. **Mimics legitimate traffic**, making detection more difficult.

## 🛠️ **Example Usage**

To send packets with 50 extra bytes of random data:

```bash
nmap -p22 --data-length 50 target.com
```

- Each probe packet will include **50 bytes of extra padding**.
- The target still receives and processes the scan normally.
- This extra data **does not affect the scan results**, only the packet signature.

For even greater stealth, combine with **SYN scanning (`-sS`)** and **decoys (`-D`)**:

```bash
nmap -p22 -sS -D 192.168.1.10,192.168.1.11,ME,192.168.1.12 --data-length 50 target.com
```

- Now, packets come from multiple sources **and** have random data added.
- This makes traffic **look more like real connections**, confusing network monitoring tools.

## 🔥 **Avoiding Detection Further: Customizing Packets**

To further evade security systems, you can:

1. **Vary the data length** on each scan attempt.
2. **Use fragmentation (`-f`)** or **custom MTU (`--mtu`)** to break packets into smaller pieces.
3. **Modify headers** with other options like `--ttl` or `--source-port` to make the scan less recognizable.

## ✅ **Advantages of Using `--data-length`**

✔ **Bypasses basic IDS/firewall rules** that filter based on standard Nmap packet sizes.  
✔ **Makes scan traffic look more random**, mimicking real-world network activity.  
✔ **Works well with other stealth options**, like `-D`, `-sS`, and `-f`.

## ❌ **Disadvantages**

✖ **Does not prevent logging**, only makes detection harder.  
✖ **Larger packet sizes** can slow down scans slightly.  
✖ **Some IDS tools use deep packet inspection (DPI)**, which can still detect unusual patterns.

## 🔍 **Final Thoughts**

Using `--data-length` is an effective way to disguise Nmap scans from **basic** security tools. However, for advanced detection evasion, combine it with **decoys, SYN scanning, fragmentation, and firewall rule manipulation**.

Would you like a real-world test case for experimenting with packet sizes? 🚀

---
### --spoof-mac: MAC Address Spoofing for Anonymity

The `--spoof-mac` option in Nmap allows you to **change the MAC address** of your scanning system, making it appear as if the scan is coming from a different device. This is useful for **evading tracking, bypassing MAC-based filtering, and mimicking legitimate devices** on a network.

## 🔹 **How It Works**

A MAC address is a unique identifier assigned to a network interface. Some networks **log MAC addresses** or **restrict access** based on them. Spoofing your MAC allows you to:

1. **Bypass MAC filtering**, which only allows specific devices to communicate.
2. **Appear as a trusted device**, such as a printer or an authorized user’s machine.
3. **Anonymize scans**, preventing tracking based on hardware addresses.

## 🛠️**Example Usage**

### 🔸 **Random MAC Address**

```bash
nmap --spoof-mac 0 target.com
```

- Nmap will **generate a random MAC address** for the scan.
- This makes your scan look like it’s coming from a different device.

### 🔸 **Mimic a Specific Vendor (e.g., Apple, Cisco, Intel)**

```bash
nmap --spoof-mac Apple target.com
```

- The scan will use a **random Apple-assigned MAC address**.
- Useful for blending into networks that contain Apple devices.

### 🔸 **Use a Custom MAC Address**

```bash
nmap --spoof-mac 00:11:22:33:44:55 target.com
```

- You can manually specify a **custom MAC address**.
- This is useful for mimicking **specific** devices.

## 🔥 **Avoiding Detection Further: Combining with Other Techniques**

For maximum stealth, combine **MAC spoofing** with:

- **Decoy scanning (`-D`)** to make detection even harder:
    
    ```bash
    nmap -sS -D 192.168.1.10,192.168.1.11,ME,192.168.1.12 --spoof-mac Apple target.com
    ```
    
- **Packet size obfuscation (`--data-length`)** to avoid signature detection:
    
    ```bash
    nmap --spoof-mac Cisco --data-length 50 target.com
    ```
    
- **SYN scan (`-sS`)** to prevent full TCP handshakes and reduce logging.

## ✅ **Advantages of Using `--spoof-mac`**

✔ **Bypasses MAC-based access control** on networks.  
✔ **Prevents tracking based on hardware addresses**.  
✔ **Blends into a target network** by mimicking trusted devices.  
✔ **Works with wired and wireless interfaces**.

## ❌ **Disadvantages**

✖ **Only works if the network allows untrusted MACs**—some networks enforce strict MAC filtering.  
✖ **Does not change IP address**—MAC spoofing is only effective within the local network.  
✖ **Can be detected if improperly configured**—some systems detect MAC changes.

## 🔍 **Final Thoughts**

Using `--spoof-mac` is a powerful technique for **bypassing MAC-based restrictions and anonymizing scans**, especially when combined with **decoys, SYN scans, and packet obfuscation**.

Would you like a real-world scenario to test this in a controlled environment? 🚀

---
### `-sS`: Stealthy SYN Scan

The `-sS` option in Nmap performs a **TCP SYN scan**, also known as a **half-open scan** because it **does not complete the full TCP handshake**, making it stealthier than a full connect scan.

## 🔹 **How It Works**

1. Nmap **sends a SYN packet** to the target port.
2. If the port is **open**, the target responds with **SYN-ACK**.
3. Instead of completing the handshake, Nmap **immediately sends an RST (reset)** to close the connection.
4. If the port is **closed**, the target responds with **RST** instead.
5. If the port is **filtered**, there will be **no response or an ICMP error**.

Since no full connection is made, this scan **reduces logging on the target system**.

## 🛠️ **Example Usage**

Basic SYN scan on a target:

```bash
nmap -sS target.com
```

For more stealth, combine with **packet fragmentation (`-f`)**:

```bash
nmap -sS -f target.com
```

## ✅ **Advantages**

✔ **Stealthy**—avoids logging full connections.  
✔ **Faster** than a TCP Connect (`-sT`) scan.  
✔ **Reliable**—detects open, closed, and filtered ports.

## ❌ **Disadvantages**

✖ **Requires root privileges** (uses raw sockets).  
✖ **Can still be detected by advanced IDS/IPS systems**.

---

## 🔍 **Final Thoughts**

`-sS` is **one of the best scanning techniques** for speed and stealth. Pair it with **fragmentation (`-f`) or decoys (`-D`)** for better evasion. 🚀

---

### References
[^2]: This options are used for firewall evasion