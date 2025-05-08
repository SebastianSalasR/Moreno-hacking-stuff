---
tags:
  - networking
  - wireless_communications
  - "#satellite_microwave"
  - "#geosynchronous_orbit"
---
### 📖 What is Satellite Microwave Communication?

**Satellite Microwave Communication** is a type of long-distance, wireless communication system that uses **microwave-frequency radio waves** to transmit data between ground-based stations by bouncing signals off artificial satellites orbiting the Earth.

It enables global, wide-area coverage, reaching locations where terrestrial networks are impractical or impossible.

---

## ⚙️ How Does It Work?

1. A **ground station** (called an **uplink station**) transmits a highly directional microwave signal to a **satellite transponder**.
    
2. The satellite **receives the signal**, amplifies it, changes its frequency (to avoid interference with the uplink), and then **retransmits it back** to another ground station (called a **downlink station**).
    
3. The signal may travel directly to the destination or be relayed through multiple satellites (inter-satellite links).
    

The satellite typically operates in **geosynchronous orbit (GEO)**, **medium Earth orbit (MEO)**, or **low Earth orbit (LEO)** depending on the application.

---

## 📦 Physical Description

- Uses **parabolic dish antennas** for both ground stations and onboard satellites.
    
- Satellite antennas are typically **multi-beam or spot beam** types for focused coverage.
    
- Operates in **microwave frequency bands** such as:
    
    - **C band (4–8 GHz)**
        
    - **Ku band (12–18 GHz)**
        
    - **Ka band (26–40 GHz)**
        
- Satellite has **transponders**: electronic devices that receive, amplify, frequency-shift, and retransmit signals.

---

## ⚙️ Characteristics
|Characteristic|Description|
|:--|:--|
|**Wide coverage**|Can cover entire continents or oceans depending on orbit.|
|**High latency (GEO)**|Due to signal traveling ~36,000 km up and back (~500 ms RTT).|
|**Flexible deployment**|No need for fixed infrastructure on the ground.|
|**Shared medium**|Bandwidth is shared between users; subject to congestion.|
|**Line-of-sight**|Required between ground station and satellite.|

---

## 📡 Transmission

- Ground station converts data into **microwave signals**.
    
- Uses **parabolic dish antenna** to focus the signal into a narrow beam sent to the satellite (**uplink**).
    
- The satellite processes the signal and transmits it back to another dish on Earth (**downlink**).
    
- Transmission may use digital modulation schemes like **QPSK, 8PSK, 16QAM**.
    

---

## 🌐 Applications

- **Global internet access** (Starlink, OneWeb)
    
- **Television broadcasting** (DirecTV, Dish Network)
    
- **International telephone calls**
    
- **Military and government communication**
    
- **Remote location connectivity** (ships, oil rigs, mountain outposts)
    
- **Disaster recovery communication systems**
    

---

## 📈 Characteristics of Transmission
| Feature                      | Detail                                                        |
| :--------------------------- | :------------------------------------------------------------ |
| **Frequency Range**          | **C, Ku, Ka bands**                                           |
| **Latency**                  | **~500 ms** (GEO) to **20-40 ms** (LEO/MEO)                   |
| **Bandwidth**                | High capacity per transponder, though shared among users      |
| **Range**                    | **Global** or regional, depending on orbit type               |
| **Interference Sensitivity** | Prone to **rain fade** (especially in higher frequency bands) |
| **Security**                 | Requires encryption for sensitive data                        |

---

## 🛰️ Types of Orbits Used

| Orbit Type | Altitude        | Coverage              | Latency   | Example Uses                      |
| :--------- | :-------------- | :-------------------- | :-------- | :-------------------------------- |
| **LEO**    | 500–2,000 km    | Smaller, local/global | 20–50 ms  | Internet (Starlink), imaging      |
| **MEO**    | 2,000–35,786 km | Regional/global       | 50–150 ms | Navigation (GPS, Galileo)         |
| **GEO**    | 35,786 km       | Fixed, wide area      | 500+ ms   | TV broadcast, telephony, internet |