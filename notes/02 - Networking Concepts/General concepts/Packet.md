---
tags:
  - networking
  - "#packets"
  - "#tcp"
  - "#udp"
aliases:
  - packets
---
## 🪶Definition
> In networking, a **packet** is a small segment of a larger message. Data sent over computer networks, such as the internet, is divided into packets. These packets are then recombined by the computer or device that receives them.

Suppose a user needs to load an image. The image file does not go from a web server to the user's computer in one piece. Instead, it is broken down into `packets` of data, sent over the wires, cables, and radio waves of the Internet, and then reassembled by the user's computer into the original photo.

---
## 📦 Why use packets?
Theoretically, it **could be possible to send files and data over the Internet without chopping them down into small packets of information**. One computer could send data to another computer in the form of a long unbroken line of bits.

However, such an approach quickly **becomes impractical** when more than two computers are involved. While the long line of bits passed over the wires between the two computers, no third computer could use those same wires to send information — it would have to wait its turn. In contrast to this approach, the internet is a [[Packet Switching]] network.

For more information click on [[Packet Switching]].

---
## 🏷️ What is a packet header?
A packet header is a "label" of sorts, which provides information about the packet’s contents, origin, and destination.

Packets consist of **two portions**: the **header and** the **payload**. The **header contains information about the packet**, such as its origin and destination IP addresses (an IP address is like a computer's mailing address). The **payload is the actual data**. Referring back to the photo example, the thousands of packets that make up the image each have a payload, and the payload carries a little piece of the image.

---
## 📜 What are packet trailers and footers?
**Packet headers go at the front** of each packet. [[Router]], [[Switch]], computers, and anything else that processes or receives a packet will see the header first. **A packet can also have trailers and footers attached at the end**. Like headers, these contain additional information about the packet.

Only certain network protocols attach trailers or footers to packets; most only attach headers. ESP (part of the [IPsec](https://www.cloudflare.com/learning/network-layer/what-is-ipsec/) suite) is one example of a network layer protocol that attaches trailers to packets.

---
## 🌍 What is an IP packet?
**Packets are sometimes defined by the protocol they are using**. A packet with an [[Internet Protocol (IP)]] header can be referred to as an "IP packet." An IP header contains important information about where a packet is from (its source IP address), where it is going (destination IP address), how large the packet is, and how long network routers should continue to forward the packet before dropping it. It may also indicate whether or not the packet can be fragmented, and include information about reassembling fragmented packets.

---
## 🛡️ How to Detect Malicious Network Traffic?

Cybercriminals often **manipulate network packets** to carry out attacks such as **DDoS, phishing, and data exfiltration**. Here’s how to spot **suspicious network activity**:

🚨 **1. Unusual Traffic Spikes**  
🔍 A sudden **increase in incoming/outgoing data** may indicate a **DDoS attack** or **data theft**.

🚨 **2. Unexpected IP Addresses**  
🔍 Look for packets **coming from or going to unknown, suspicious, or foreign IP addresses**.

🚨 **3. Strange Packet Sizes**  
🔍 Many attacks use **abnormally large or tiny packets** to evade detection.

🚨 **4. High Volume of Requests to One Server**  
🔍 A large number of **requests from multiple IPs** could indicate a **botnet attack**.

🚨 **5. Unusual Protocol Behavior**  
🔍 Packets using **unexpected ports** or unusual **protocol combinations** may indicate **malicious activity**.

🚨 **6. Spoofed Headers**  
🔍 Attackers often **fake source IP addresses** to hide their identity.

🔧 **How to Monitor and Prevent Threats?**  
✔️ Use **Intrusion Detection Systems (IDS)** and **Intrusion Prevention Systems (IPS)**  
✔️ Monitor **firewall logs**  
✔️ Analyze packets with **Wireshark or similar tools**  
✔️ Block traffic from **known malicious IP addresses**

Specific techniques can be seen on [[Nmap Parameters]]

---
## References:
- What is a packet?: https://www.cloudflare.com/learning/network-layer/what-is-a-packet/

