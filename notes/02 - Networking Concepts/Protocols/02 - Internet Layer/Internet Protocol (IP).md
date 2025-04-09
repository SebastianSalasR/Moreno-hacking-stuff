---
tags:
  - "#ip"
  - "#ipv4"
  - "#ipv6"
  - "#networking"
  - "#routing"
  - "#subnetting"
---

## 📘 Definition
> The Internet Protocol (IP) is a protocol, or set of rules, for routing and addressing packets of data so that they can travel across networks and arrive at the correct destination. Data traversing the Internet is divided into smaller pieces, called [packets](https://www.cloudflare.com/learning/network-layer/what-is-a-packet/). IP information is attached to each packet, and this information helps [routers](https://www.cloudflare.com/learning/network-layer/what-is-a-router/) to send packets to the right place. Every device or [domain](https://www.cloudflare.com/learning/dns/glossary/what-is-a-domain-name/) that connects to the Internet is assigned an [IP address](https://www.cloudflare.com/learning/dns/glossary/what-is-my-ip-address/), and as packets are directed to the IP address attached to them, data arrives where it is needed.
---

## 📦 IP Packet Structure (Simplified)
- **Header**: Contains source & destination IP addresses, protocol, TTL, etc.
- **Payload**: The actual data being transmitted.

---

## 🌍 IP Versions

### IPv4
- 32-bit address (e.g., `192.168.1.1`)
- ~4.3 billion unique addresses
- Still widely used

### IPv6
- 128-bit address (e.g., `2001:0db8:85a3::8a2e:0370:7334`)
- Virtually unlimited addresses
- Designed to replace IPv4 due to address exhaustion

---

## 🔁 IP Address Types

### 🧍‍♂️ Unicast
- One-to-one communication
- Most common for internet traffic

### 📢 Broadcast (IPv4 only)
- One-to-all on a local network (e.g., `255.255.255.255`)

### 👥 Multicast
- One-to-many (e.g., streaming video to multiple users)

### 🌀 Anycast (IPv6)
- One-to-nearest (used in CDN networks like Cloudflare)

---

## 🔐 Classes of IP Addresses (IPv4)

| Class | Range | Use |
|-------|-------|-----|
| A     | 1.0.0.0 – 126.255.255.255 | Large networks |
| B     | 128.0.0.0 – 191.255.255.255 | Medium networks |
| C     | 192.0.0.0 – 223.255.255.255 | Small networks |
| D     | 224.0.0.0 – 239.255.255.255 | Multicast |
| E     | 240.0.0.0 – 255.255.255.255 | Reserved |

---

## 🏠 Private IP Ranges

| Range | CIDR | Use |
|-------|------|-----|
| 10.0.0.0 – 10.255.255.255 | /8 | Large orgs |
| 172.16.0.0 – 172.31.255.255 | /12 | Medium orgs |
| 192.168.0.0 – 192.168.255.255 | /16 | Home/small networks |

---

## 🚧 Key Concepts

- **Subnetting**: Dividing a network into smaller networks
- **NAT (Network Address Translation)**: Allows private IPs to access the internet using one public IP
- **TTL (Time to Live)**: Limits packet lifetime to prevent looping

---
# 🔧 Practical Example: Visiting a Website

Let’s say you open your browser and go to `https://example.com`. Here's how the **IP protocol** plays its part in getting you that web page:

---

### 🧭 Step-by-Step

#### 1. **DNS Resolution**

Your device first needs to find out the IP address of `example.com`.

- Your computer sends a **DNS request** asking, “What’s the IP address of `example.com`?”
    
- DNS replies with something like:  
    `93.184.216.34` (IPv4 address)
    

> IP Protocol is about to kick in now!


#### 2. **Creating IP Packets**

Your computer needs to **request the web page**. To do that:

- It wraps your HTTP request (the "payload") in a **TCP segment**.
    
- Then wraps that segment in an **IP packet**.
    

The **IP header** will include:

- Source IP (your device, e.g., `192.168.1.10`)
    
- Destination IP (`93.184.216.34`)
    

#### 3. **Sending the Packet**

The IP packet is sent to your router.

- If the destination is not in your local network, the router forwards it to the next hop.
    
- Eventually, the packet travels **across the internet** using many routers, each using the **destination IP** to forward it.
    



#### 4. **Response From the Server**

The web server at `93.184.216.34` receives the packet and:

- Sends back a **response** (like the HTML of the page), also in an IP packet.
    
- That response has:
    
    - Source IP: `93.184.216.34`
        
    - Destination IP: your IP
        


#### 5. **Receiving the Response**

Your computer:

- Reads the destination IP in the packet.
    
- Passes the payload (HTML) up to your browser.
    
- Your browser renders the page.

---
## References
1. For more information click [cloud flare article](https://www.cloudflare.com/learning/network-layer/internet-protocol/)