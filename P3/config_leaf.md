# Leaf routers

## reset network conf
For each leaf router, reset network conf in bash:
``` sh
ip address flush dev eth0
ip address flush dev eth1 2>/dev/null
ip address flush dev eth2 2>/dev/null
ip link del br0 2>/dev/null
ip link del vxlan10 2>/dev/null
```

## VXLAN conf
VXLAN must be configured in at least 2 leaf routers, in order to create the tunneling (VTEP).
Here, we will configure router 2 and router 4.

### Router 2
```sh
ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth1
```

### Router 4
```sh
ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth0
```

## network config in vtysh
Now, we configure the BGP with OSPF in vtysh, for each leaf router.

### Router 2
```sh
conf t
hostname router_wnaseeve-2
no ipv6 forwarding
interface eth0
ip address 10.1.1.2/30
ip ospf area 0
interface lo
ip address 1.1.1.2/32
ip ospf area 0
router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo
address-family l2vpn evpn
neighbor 1.1.1.1 activate
advertise-all-vni
exit-address-family
router ospf
```

### Router 3
```sh
conf t
hostname router_wnaseeve-3
no ipv6 forwarding
interface eth1
ip address 10.1.1.6/30
ip ospf area 0
interface lo
ip address 1.1.1.3/32
ip ospf area 0
router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo
address-family l2vpn evpn
neighbor 1.1.1.1 activate
exit-address-family
router ospf
```

### Router 4
```sh
conf t
hostname router_wnaseeve-4
no ipv6 forwarding
interface eth2
ip address 10.1.1.10/30
ip ospf area 0
interface lo
ip address 1.1.1.4/32
ip ospf area 0
router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo
address-family l2vpn evpn
neighbor 1.1.1.1 activate
advertise-all-vni
exit-address-family
router ospf
```