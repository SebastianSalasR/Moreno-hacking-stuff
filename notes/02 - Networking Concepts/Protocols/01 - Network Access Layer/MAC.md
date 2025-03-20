---
tags:
  - "#networking"
  - "#identifier"
  - "#adress"
  - "#mac-spoofing"
  - "#macchanger"
---
## 🪶 Definition
> **MAC Addresses** are unique **48-bit** hardware numbers of a computer that are embedded into a network card (known as a [Network Interface Card](https://www.geeksforgeeks.org/nic-full-form/)) during manufacturing. The MAC Address is also known as the [Physical Address](https://www.geeksforgeeks.org/logical-and-physical-address-in-operating-system/) of a network device.

MAC Address is worldwide unique since millions of network devices exist and we need to uniquely identify each.

---
## Format of MAC Adress

A MAC Address is a 12-digit hexadecimal number (48-bit binary number), which is mostly **represented by Colon-Hexadecimal**.

The First 6 digits (say 00:40:96) of the MAC Address identify the manufacturer, called the OUI (**Organizational Unique Identifier**).

Here are some examples of Asus OUIs:
```shell
macchanger -l | grep -i asus | head -n 5
1040 - 00:04:0f - Asus Network Technologies, Inc.
1533 - 00:05:fc - Schenck Pegasus Corp.
3155 - 00:0c:6e - ASUSTEK COMPUTER INC.
3723 - 00:0e:a6 - ASUSTEK COMPUTER INC.
4372 - 00:11:2f - ASUSTek Computer Inc.
```

---
## 📂 Types of MAC Addresses

### 1️⃣ **Unicast MAC Address**

🔹 **What is it?**  
A **unicast MAC address** is used for **one-to-one communication** between two devices. When a network device sends a frame with a unicast destination MAC address, only **one specific device** will process it.

🔹 **Why is it needed?**

1. Ensures direct communication between two devices.
2. Used in standard **client-server models**, like when your laptop requests a webpage from a server.
3. Helps in efficient **network traffic management**, reducing unnecessary data transmission.

🔹 **Example Devices that Use Unicast MAC Addresses:**

1. **Computers & Laptops**: When sending data to a specific router or switch.
2. **Printers**: When a computer sends a print job to a network printer.
3. **VoIP Phones**: Communicating directly with a VoIP server.

🔹 **Example Address:**  
`00:1A:2B:3C:4D:5E`

---
### 2️⃣ **Multicast MAC Address**

🔹 **What is it?**  
A **multicast MAC address** allows one device to send data to **multiple devices simultaneously** without broadcasting to all devices on the network. These addresses always start with **01:00:5E**.

🔹 **Why is it needed?**

- Reduces network congestion by **only sending data to relevant devices** instead of broadcasting to everyone.
- Used for services like **streaming, online gaming, and real-time communication** where multiple devices need the same data.
- Efficient for **IoT (Internet of Things) devices** that need synchronized updates.

🔹 **Example Devices that Use Multicast MAC Addresses:**

- **Smart TVs & Streaming Devices**: Receiving video streams from a multicast IPTV service.
- **Game Consoles**: Participating in multiplayer gaming sessions.
- **IoT Devices (Smart Lights, Thermostats, Sensors)**: Receiving control commands from a central hub.

🔹 **Example Address:**  
`01:00:5E:10:20:30`

---
### 3️⃣ **Broadcast MAC Address**

🔹 **What is it?**  
A **broadcast MAC address** is used to send data to **all devices on the network**. The broadcast MAC address is always:  
`FF:FF:FF:FF:FF:FF`.

🔹 **Why is it needed?**

- Used when a device needs to **discover other devices on the network**.
- Essential for **network management and initialization**, like **DHCP** (Dynamic Host Configuration Protocol) requests.
- Helps in cases where a device **doesn’t know the recipient’s MAC address** and needs to find it using **ARP (Address Resolution Protocol)**.

🔹 **Example Devices that Use Broadcast MAC Addresses:**

- **Routers & Switches**: Sending ARP requests to find devices.
- **Smartphones & Laptops**: Requesting a local IP address via DHCP.
- **Security Systems**: Sending emergency alerts to all devices on a local network.

🔹 **Example Address:**  
`FF:FF:FF:FF:FF:FF`

---
## Why Should the MAC Address be unique in the LAN Network?
Within a network, each device possesses a distinct identifier referred to as a MAC (Media Access Control) address. Think of it as a unique name assigned to the device. When information is transmitted across the network, it is directed to a specific MAC address, much like a letter being addressed to a specific individual.

However, if multiple devices within the same network were to have identical MAC addresses, it would result in confusion and disrupt the network’s functioning. The network would struggle to ascertain which device should receive the transmitted information. To prevent this confusion and ensure the accurate delivery of information, it is vital for each device on a network to possess a unique MAC address.

---
## 🔥 Potential Issues When Two Devices Have the Same MAC Address

### 1️⃣ MAC Address Conflicts & Network Instability

- **Switches use MAC addresses** to determine where to forward packets. If two devices share the same MAC, the switch will be confused about which port to send traffic to.
- The switch will update its MAC address table rapidly as each device **overwrites the other’s entry**, causing **packet loss and intermittent connectivity** for both devices.

🔹 **Example Scenario**  
A computer and a printer accidentally have the same MAC address. When another computer tries to send a print job, the switch may send it to the **wrong device** or drop the packet entirely.

---

### 2️⃣ IP Address Conflicts (If Using DHCP)

- If both devices request an IP address from the **DHCP server**, the server may assign the same IP to both devices, **causing communication failures**.
- Alternatively, if one device already has an IP and another device with the same MAC joins, it may **steal[^1] the IP**, kicking the first device offline.

🔹 **Example Scenario**  
Your laptop and your phone have the same MAC. The DHCP server gives an IP to one device, but when the second device requests an IP, it either gets the same one (causing disconnects) or gets blocked entirely.

---

### 3️⃣ Man-in-the-Middle Attacks (MAC Spoofing)

- **Attackers can intentionally clone** the MAC address of a trusted device to **intercept traffic or bypass security controls**.
- This can be used to **bypass MAC filtering** on Wi-Fi networks or **steal session data** in a LAN.

🔹 **Example Attack**  
A hacker spoofs the MAC of a **router or gateway**, making all devices send traffic to the attacker instead of the real router (**ARP poisoning**).

---
## 🤫 Changing the MAC with [MACChanger](https://github.com/shilch/macchanger) step by step
1. **Bring down the network interface** before changing the MAC:
```zsh
sudo ip link set wlan0 down   # Replace wlan0 with your interface name
```
2. **Set a random MAC address**:
```zsh
sudo macchanger -r wlan0
```
3. **Set a specific MAC address:**
```zsh
sudo macchanger -m XX:XX:XX:XX:XX:XX wlan0
```
4. **Re-enable the network interface:**
```zsh
sudo ip link set wlan0 up
```
5. **Verify the change:**
```zsh
ip link show wlan0
```
## ⚠️ **Important Considerations**

✔ **Changing MAC addresses can violate network policies.**  
✔ **Some networks use MAC filtering; spoofing can bypass it.**  
✔ **Temporary changes revert after reboot unless configured persistently.**  
✔ **For wireless cards, some drivers may not support MAC spoofing.**

**Use responsibly and for ethical purposes!**(xd)

---
## References:
- [^1] Investigate how this attack can be made. Maybe changing the mac with macchanger before connecting to a network and listen with tcpdump to capture the traffic. 
- For more information click [here](https://www.geeksforgeeks.org/mac-address-in-computer-network/)
