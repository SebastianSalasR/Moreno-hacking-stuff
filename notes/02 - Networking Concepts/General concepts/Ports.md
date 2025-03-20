---
tags:
  - "#networking"
  - ports
  - nmap
aliases:
  - port
---
---
# Definition
> In [computer networking](https://en-m-wikipedia-org.translate.goog/wiki/Computer_network?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "Computer network"), a **port** or **port number** is a number assigned to uniquely identify a connection endpoint and to direct data to a specific service. At the software level, within an [operating system](https://en-m-wikipedia-org.translate.goog/wiki/Operating_system?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "Operating system"), a port is a logical construct that identifies a specific [process](https://en-m-wikipedia-org.translate.goog/wiki/Process_(computing)?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "Process (computing)") or a type of [network service](https://en-m-wikipedia-org.translate.goog/wiki/Network_service?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "Network service"). A port at the software level is identified for each [transport protocol](https://en-m-wikipedia-org.translate.goog/wiki/Transport_protocol?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "Transport protocol") and address combination by the port number assigned to it. The most common transport protocols that use port numbers are the [Transmission Control Protocol](https://en-m-wikipedia-org.translate.goog/wiki/Transmission_Control_Protocol?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "Transmission Control Protocol") (TCP) and the [User Datagram Protocol](https://en-m-wikipedia-org.translate.goog/wiki/User_Datagram_Protocol?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "User Datagram Protocol") (UDP); those port numbers are 16-bit [unsigned numbers](https://en-m-wikipedia-org.translate.goog/wiki/Unsigned_number?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc "Unsigned number").

To see more information click [here](https://en-m-wikipedia-org.translate.goog/wiki/Port_(computer_networking)?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc).

---

### Understanding Port States in [[Nmap]]

Nmap identifies the state of ports during a scan to indicate their availability and responsiveness. Common port states include:

- **Open**: The port is actively accepting connections and is available for communication. This often indicates a running service on the port.
- **Closed**: The port is accessible but not currently associated with a service. It may become open if a service starts on it.
- **Filtered**: Nmap cannot determine whether the port is open or closed due to network filtering (e.g., firewalls).
- **Unfiltered**: The port is reachable but Nmap cannot determine its state.