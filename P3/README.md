The main difference between the console and auxiliary ports is that the auxiliary port supports hardware flow control and the console port does not. Flow control paces the transmission of data between a sending device and a receiving device. Flow control ensures that the receiving device can absorb the data sent to it before the sending device sends more. When the buffers on the receiving device are full, a message is sent to the sending device to suspend transmission until the data in the buffers has been processed. Because the auxiliary port supports flow control, it is ideally suited for use with the high-speed transmissions of a modem. Console terminals send data at slower speeds than modems; therefore, the console port is ideally suited for use with console terminals. "

out-of-band management involves the use of a dedicated circuit  for managing network nodes. this means that data traffic and mangement traffic do not share the same circuit. in case of out-of-bound management, traffic flows within a network on which no production traffic resides.

in-band management means  traffic flows across  the enterprise production network  or the internet ( or both). date traffic and mangement traffic share the same channel

RELEVANT RFCs
BGP : 4271
VXLAN : 
EVPN  : 

BGP = Border Gateway Protocol
	exterior routing protocol, used to exchange info between autonomous systems

VXLAN (RFC 7348)
EVPN (RFC 7432)
busybox
BGPD (service)
OSFPD (service) = Open Shortest Path First
	interior routing protocol used to exchange info between gateways (eg: routers) WITHIN autinomous systems
IS-IS routing engine service = Intermediate System to Intermediate System
	interiori routing protocol used to exchange info between gateways (eg: routers) WITHIN autinomous systems
static multicast (same as static mapping?)
dynamic multicast
ICMP protocol
ARP protocol
MPLS (which is not to be used)
MAC address
Route Reflection
"leaf" switches vs "spine" switches
VTEP = VXLAN Tunneling End Point
dynamic relations for leafs
OSPF
VNI (VXLAN Network Identifier) 
route types (type 2, type 3)

STP
autonomous system
	a collection of connected IP routing prefixes that presents a common and clearly defined routing policy to internet

dstport
TOR = Top Of the Rack switches

### MPLS (Multiprotocol Label Switching)

**Multiprotocol Label Switching (MPLS)** is a high-performance network routing technique that directs data from one node to the next based on short path labels rather than long network addresses. It is designed to speed up and shape traffic flows across enterprise wide area and service provider networks.

#### Benefits of MPLS:

- **Speed**: By using labels, MPLS can forward packets more quickly than traditional IP routing.
- **Quality of Service (QoS)**: MPLS supports traffic engineering, allowing for the prioritization of certain types of traffic.
- **Scalability**: MPLS can support a large number of VPNs and can be used to create scalable and flexible network architectures.
- **Flexibility**: MPLS is protocol-agnostic and can carry a variety of network protocols, including IP, ATM, and Frame Relay.



### Route Distinguisher (RD)
A **Route Distinguisher (RD)** is a unique identifier used in MPLS (MultiProtocol Label Switching) VPNs to distinguish between identical IP prefixes in different VPNs. It ensures that the same IP address can exist in multiple VRFs (Virtual Routing and Forwarding instances) without causing conflicts.

- **Purpose**: To make IP prefixes unique across different VRFs.
- **Format**: Typically, an RD is a 64-bit value, often represented as `ASN:nn` or `IP-address:nn`.
- **Usage**: When a route is advertised in a VPN, the RD is prepended to the IP prefix, creating a unique VPN-IPv4 or VPN-IPv6 address.

### Route Target (RT)
A **Route Target (RT)** is an extended BGP community attribute used to control the import and export of routes between VRFs. It defines which routes should be imported into or exported from a particular VRF.

- **Purpose**: To manage route distribution between VRFs.
- **Format**: Similar to RDs, RTs are also 64-bit values, often represented as `ASN:nn` or `IP-address:nn`.
- **Usage**: RTs are attached to routes when they are exported from a VRF. When importing routes into a VRF, the RTs are matched against the import policy to determine if the route should be accepted.

### Ethernet Tag (ET)
An **Ethernet Tag (ET)** is used in EVPN (Ethernet VPN) to identify a specific Ethernet segment. It helps in distinguishing between different broadcast domains or VLANs within the EVPN.

- **Purpose**: To identify and manage Ethernet segments in EVPN.
- **Format**: Typically, an Ethernet Tag is a 32-bit identifier.
- **Usage**: ETs are used in EVPN advertisements to indicate which Ethernet segment a particular MAC address belongs to. This helps in efficient MAC address learning and forwarding.



