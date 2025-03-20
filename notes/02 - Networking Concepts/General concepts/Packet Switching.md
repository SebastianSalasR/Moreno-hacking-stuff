---
tags:
  - "#router"
  - "#latency"
  - "#network-topology"
---
## 🪶 Definition
> **Packet Switching** in computer networks is a method of transferring data to a network in the form of packets. In order to transfer the file fast and efficiently over the network and minimize the transmission latency, the **data is broken into small pieces of variable length**, called [[Packet]]. At the destination, all these small parts (packets) have to be reassembled, belonging to the same file. A packet is composed of a payload and various control information. No pre-setup or reservation of resources is needed.

---
## 🐌 Types of Delays in Packet Switching

- **Transmission Delay:** Time required by the **spent** station to transmit data to the link.
- **Propagation Delay:** Time of data propagation through the link.
- **Queueing Delay:** Time spent by the packet at the destination’s queue.
- **Processing Delay:** Processing time for data at the destination.

---
## Advantages of Packet Switching over Circuit Switching

- More efficient in terms of bandwidth, since the concept of reserving a circuit is not there.
- Minimal transmission latency.
- More reliable as a destination can detect the missing packet.
- More fault tolerant because packets may follow a different path in case any link is down, Unlike Circuit Switching.
- Cost-effective and comparatively cheaper to implement.
---
## Disadvantage of Packet Switching over Circuit Switching

- Packet Switching doesn’t give packets in order, whereas Circuit Switching provides ordered delivery of packets because all the packets follow the same path.
- Since the packets are unordered, we need to provide sequence numbers for each packet.
- Complexity is more at each node because of the facility to follow multiple paths.
- Transmission delay is more because of rerouting.
- Packet Switching is beneficial only for small messages, but for bursty data (large messages) Circuit Switching is better.

---
## 🤔 Why use packet switching?

Theoretically, we could send an entire file as a single, continuous stream of data. However, this method would cause significant delays and inefficiencies, especially when multiple devices are sharing the same network.

To illustrate why packets are necessary, let’s use a **math-based example**:

#### 🚀 Example: Downloading a 500 MB File with a 100 Mbps Connection

Imagine you’re downloading a **500 MB file** (megabytes) and your Internet speed is **100 Mbps** (megabits per second).

1. **Convert units:**
    
    - 1 byte = **8 bits**, so 500 MB = **500 × 8 = 4000 megabits (Mb)**
    - Your download speed is 100 Mbps, meaning you can transfer **100 megabits per second**
2. **How long would it take to download the entire file at once?**
    $$
    \frac{4000 \text{ Mb}}{100 \text{ Mbps}} = 40 \text{ seconds}
    $$
    If we could send this file in one uninterrupted stream, it would take **40 seconds**, and **no other device** could use the network during this time. This would block other users and slow down everything else.
    
---

## 🌐 Why Packet Switching Helps

Instead of sending the **entire 500 MB file at once**, the Internet **chops it into smaller packets** (usually **1,500 bytes or 12,000 bits per packet**).

- Each packet **travels independently**, possibly taking different routes to the destination.
- This allows multiple users to share the same network efficiently.
- If a packet is lost, only that small piece needs to be resent instead of the entire file.

---

## 🔄 Another Perspective: A Highway Analogy

Think of the **500 MB file** as a **long truck carrying 4000 boxes**. If the truck had to travel **all at once**, it would block the entire highway. Instead, **packet switching** is like breaking the cargo into many small delivery vans, each taking different routes to avoid congestion. This makes traffic (data transfer) **much faster and more efficient**.

---

💡 **Conclusion:** Without packet switching, downloading large files would slow down or even **block the entire network** for others. The packet-based system allows efficient data transfer, even with multiple users on the network.

---
## References:
- packet loss meaning and what causes it: https://www.fortinet.com/resources/cyberglossary/what-is-packet-loss.