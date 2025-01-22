The main difference between the console and auxiliary ports is that the auxiliary port supports hardware flow control and the console port does not. Flow control paces the transmission of data between a sending device and a receiving device. Flow control ensures that the receiving device can absorb the data sent to it before the sending device sends more. When the buffers on the receiving device are full, a message is sent to the sending device to suspend transmission until the data in the buffers has been processed. Because the auxiliary port supports flow control, it is ideally suited for use with the high-speed transmissions of a modem. Console terminals send data at slower speeds than modems; therefore, the console port is ideally suited for use with console terminals. "

out-of-band management involves the use of a dedicated circuit  for managing network nodes. this means that data traffic and mangement traffic do not share the same circuit. in case of out-of-bound management, traffic flows within a network on which no production traffic resides.

in-band management means  traffic flows across  the enterprise production network  or the internet ( or both). date traffic and mangement traffic share the same channel


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

