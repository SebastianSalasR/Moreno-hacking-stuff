---
tags:
  - "#tcp"
  - "#networking"
---
## 🪶 Definition
> The **TCP/IP model** is a framework that outlines how data should be transmitted, routed, and received over networks like the internet. It breaks networking down into four abstraction layers, each with distinct responsibilities — from physical data transmission to software applications communicating across the globe.

---
## 🔗 1. Link Layer (Network Interface Layer)

> The **Link Layer** is the foundation of the TCP/IP model. It handles **direct communication** between devices on the same physical or logical network. This includes how data is **physically transmitted**, how devices are identified at the hardware level, and how errors are detected at this stage.

### 🧩 Protocols & Technologies:

- [[Ethernet]]
    
- **Wi-Fi (IEEE 802.11)**
    
- **PPP (Point-to-Point Protocol)**
    
- [[ARP]]
    

### 💻 Example:

- Your computer uses **ARP** to find the MAC address of your router (within the same subnet) to send a packet.
    
- **Ethernet** transmits frames from your PC to a network switch using copper cables.
    

---

## 🛰 2. Internet Layer

> The **Internet Layer** is responsible for assigning **logical addresses (IP addresses)** and determining the **best path** for packets to travel across interconnected networks. It ensures that your data can travel beyond your local network to reach destinations worldwide.

### 🧩 Protocols:

- [[IP]] – Routing and addressing
    
- [[ICMP]] – Network diagnostics (e.g., ping)
    
- **IGMP (Internet Group Management Protocol)** – Manages multicast groups
    

### 💻 Example:

- When you visit `example.com`, **IP** routes packets from your laptop in Chile to a web server in the US.
    
- [[ICMP]] is used in tools like `ping` or `traceroute` to test connectivity and diagnose issues.
    

---

## 🔁 3. Transport Layer

> The **Transport Layer** is in charge of managing **end-to-end communication** between applications. It ensures that data sent from one system arrives **reliably and in the correct order** (TCP), or quickly with minimal overhead (UDP). It also provides **flow control**, **error handling**, and **session multiplexing**.

### 🧩 Protocols:

- [[TCP]] – Reliable, ordered, and error-checked delivery
    
- [[UDP]] – Fast, connectionless, less reliable
    

### 💻 Example:

- A **TCP** connection is established during an SSH session, ensuring secure, ordered delivery of terminal commands.
    
- A **VoIP call** uses **UDP** for real-time audio — prioritizing speed over reliability to avoid delays.
    

---

## 🌐 4. Application Layer

> The **Application Layer** is where **user-facing software and network services** operate. It defines the protocols and interfaces that applications use to **exchange meaningful data**, such as web pages, emails, and remote sessions. This is the layer most exposed to the user.

### 🧩 Protocols:

- [[HTTP & HTTPS]] – Browsing websites
    
- [[FTP]] – Transferring files
    
- [[SMTP]] – Sending and receiving email
    
- [[DNS]] – Translating domain names into IPs
    
- [[SSH]]/**Telnet** – Remote access to other machines
    

### 💻 Example:

- When you open a browser and visit `https://openai.com`, your browser uses **HTTP** on top of **TCP** to request and display the site.
    
- When you send an email, your client uses **SMTP** to transfer it to the mail server.
    

---

## 🧠 Summary Table

|Layer|Role & Function|Common Protocols|Example Use Case|
|---|---|---|---|
|🧱 Link Layer|Handles hardware-level addressing and data transfer within local networks|Ethernet, Wi-Fi, ARP, PPP|Sending frames from your PC to a router|
|🛰 Internet Layer|Provides IP addressing and routes packets across interconnected networks|IP, ICMP, IGMP|Getting your data from Chile to the US|
|🔁 Transport Layer|Manages reliable or fast delivery of data between applications|TCP, UDP|SSH, web traffic, VoIP, gaming|
|🌐 Application Layer|Enables software to communicate using standardized network services and formats|HTTP, DNS, FTP, SMTP, SSH|Browsing, file transfers, email, remote login|