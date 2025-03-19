---
tags:
---
## Definition
> **Transmission Control Protocol (TCP)** is a communications standard that enables application programs and computing devices to exchange messages over a network. It is designed to send packets[^1] across the internet and ensure the successful delivery of data and messages over networks.

TCP organizes data so that it can be transmitted between a server and a client. It guarantees the integrity of the data being communicated over a network. Before it transmits data, TCP establishes a connection between a source and its destination, which it ensures remains live until communication begins. It then breaks large amounts of data into smaller packets, while ensuring data integrity is in place throughout the process.

As a result, high-level protocols that need to transmit data all use TCP Protocol.  Examples include peer-to-peer sharing methods like [[FTP]], [[SSH]] and Telnet. It is also used to send and receive email through Internet Message Access Protocol (IMAP), Post Office Protocol (POP), and Simple Mail Transfer Protocol (SMTP), and for web access through the [Hypertext Transfer Protocol (HTTP)](https://www.fortinet.com/resources/cyberglossary/what-is-https).

An alternative to TCP in networking is [[UDP]], which is used to establish [low-latency](https://www.fortinet.com/resources/cyberglossary/latency) connections between applications and decrease transmissions time. TCP can be an expensive network tool as it includes absent or corrupted packets and protects data delivery with controls like acknowledgments, connection startup, and flow control.

UDP does not provide error connection or packet sequencing nor does it signal a destination before it delivers data, which makes it less reliable but less expensive. As such, it is a good option for time-sensitive situations, such as [Domain Name System (DNS)](https://www.fortinet.com/resources/cyberglossary/what-is-dns) lookup, Voice over Internet Protocol (VoIP), and streaming media.

---
## References
[^1]: packet loss meaning and what causes it: https://www.fortinet.com/resources/cyberglossary/what-is-packet-loss.