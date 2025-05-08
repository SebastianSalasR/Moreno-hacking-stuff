---
tags:
  - "#packets"
  - "#transport-layer"
  - "#networking"
  - "#udp"
aliases:
  - Transmission Control Protocol
---

##  🪶 Definition

> **TCP** is a **connection-oriented** communication protocol used to **reliably transmit data** across networks. It ensures that information sent from one device to another arrives **intact, in order, and without duplication**.

---

## 📦 How TCP Works

TCP acts as a delivery manager between two hosts:

1. **Connection Establishment**:
    
    - Uses a **three-way handshake** (SYN → SYN-ACK → ACK) to create a reliable connection between sender and receiver.
        
    - Ensures both sides are ready before transmitting data.
        
2. **Data Segmentation**:
    
    - Breaks down large data into smaller, manageable **segments** (packets).
        
3. **Reliable Transmission**:
    
    - Each segment is numbered so that it can be **reassembled** in the correct order.
        
    - Uses **acknowledgments (ACKs)** to confirm delivery.
        
    - If a packet is lost or corrupted, it is **retransmitted**.
        
4. **Flow & Congestion Control**:
    
    - Adjusts data rate to avoid overwhelming the network or the receiver.
        
5. **Connection Termination**:
    
    - Ends the session gracefully using a **four-step FIN process**.
        

---

## 📌 Why TCP?

TCP is used when **reliability is crucial**. It ensures:

- No data loss
    
- Proper order of messages
    
- Error detection and correction
    

---

## 🌐 Common Protocols That Use TCP

- 🔐 [[SSH]], Telnet – Secure remote access
    
- 📂 [[FTP]] – File transfer
    
- 📧 [[SMTP]], IMAP, POP – Email communication
    
- 🌍 [[HTTP & HTTPS]] – Browsing the web
    

---

## ⚠️ Compared to [[UDP]]

While **UDP** sacrifices reliability for speed, **TCP** is built for **accuracy and completeness**. This makes it ideal for:

- File transfers
    
- Web browsing
    
- Email
    
- Any service where missing or out-of-order data is unacceptable
    

> ⚠️ **Note**: TCP can introduce more **latency and overhead** due to its reliability mechanisms.

---

## 🧠 TL;DR

|Feature|TCP|
|---|---|
|Type|Connection-oriented|
|Reliability|✅ Guaranteed delivery|
|Packet Ordering|✅ In-order delivery|
|Speed|🐢 Slower (more overhead)|
|Use Cases|Web, Email, File Transfer, Remote Access|

---

## References
1. packet loss meaning and what causes it: https://www.fortinet.com/resources/cyberglossary/what-is-packet-loss.