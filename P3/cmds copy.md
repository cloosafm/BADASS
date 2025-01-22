# P3 - EVPN

## only start the 4 routers
then do config for router 2, then r1, r3 and finally r4

## router 1

```sh
vtysh << EOF
configure terminal
! Turn off IPv6 forwarding
no ipv6 forwarding
! Set the IP addres on eth0 interface
interface eth0
 ip address 10.1.1.1/30
exit
! Set the IP addres on eth1 interface
interface eth1
 ip address 10.1.1.5/30
exit
! Set the IP addres on eth2 interface
interface eth2
 ip address 10.1.1.9/30
exit
! Set the IP addres on lo interface
interface lo
 ip address 1.1.1.1/32
exit
! Enable a routing process BGP with AS number 1
router bgp 1
 ! Create a BGP peer-group tagged DYNAMIC
 neighbor DYNAMIC peer-group
 ! Assign the peer group to AS number 1
 neighbor DYNAMIC remote-as 1
 ! Communicate with a neighbor through lo interface
 neighbor DYNAMIC update-source lo
 ! Configure BGP dynamic neighbors listen on specified TRUSTED range and add then to specified peer group
 bgp listen range 1.1.1.0/24 peer-group DYNAMIC
 ! Configure a neighbor in peer group DYNAMIC as Route Reflector client
 address-family l2vpn evpn
  neighbor DYNAMIC activate
  neighbor DYNAMIC route-reflector-client
 exit-address-family
exit
! Enable routing process OSPF on all IP networks on area 0
router ospf
 network 0.0.0.0/0 area 0
exit
EOF
```


## router 2

```
ip link add name vxlan10 type vxlan id 10 dev eth0 dstport 4789
ip link set dev vxlan10 up
ip link add name br0 type bridge
ip link set dev br0 up
brctl addif br0 eth1
brctl addif br0 vxlan10

vtysh << EOF
configure terminal
! Turn off IPv6 forwarding
no ipv6 forwarding
! Set the IP addres and enable OSPF on eth0 interface
interface eth0
 ip address 10.1.1.2/30
 ip ospf area 0
exit
! Set the IP addres and enable OSPF on lo interface
interface lo
 ip address 1.1.1.2/32
 ip ospf area 0
exit
! Enable a routing process BGP with AS number 1
router bgp 1
 ! Specify a BGP neighbor with AS number 1
 neighbor 1.1.1.1 remote-as 1
 ! Communicate with a neighbor through lo interface
 neighbor 1.1.1.1 update-source lo
 ! Enable the Address Family for neighbor 1.1.1.1 and advertise all local VNIs
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
exit
! Enable a routing process OSPF
router ospf
exit
EOF
```


## router 3

```
ip link add name vxlan10 type vxlan id 10 dev eth1 dstport 4789
ip link set dev vxlan10 up
ip link add name br0 type bridge
ip link set dev br0 up
brctl addif br0 eth0
brctl addif br0 vxlan10

vtysh << EOF
configure terminal
! Turn off IPv6 forwarding
no ipv6 forwarding
! Set the IP addres and enable OSPF on eth1 interface
interface eth1
 ip address 10.1.1.6/30
 ip ospf area 0
exit
! Set the IP addres and enable OSPF on lo interface
interface lo
 ip address 1.1.1.3/32
 ip ospf area 0
exit
! Enable a routing process BGP with AS number 1
router bgp 1
 ! Specify a BGP neighbor with AS number 1
 neighbor 1.1.1.1 remote-as 1
 ! Communicate with a neighbor through lo interface
 neighbor 1.1.1.1 update-source lo
 ! Enable the Address Family for neighbor 1.1.1.1 and advertise all local VNIs
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
exit
! Enable a routing process OSPF
router ospf
exit
EOF
```


## router 4

```
ip link add name vxlan10 type vxlan id 10 dev eth2 dstport 4789
ip link set dev vxlan10 up
ip link add name br0 type bridge
ip link set dev br0 up
brctl addif br0 eth0
brctl addif br0 vxlan10

vtysh << EOF
configure terminal
! Turn off IPv6 forwarding
no ipv6 forwarding
! Set the IP addres and enable OSPF on eth2 interface
interface eth2
 ip address 10.1.1.10/30
 ip ospf area 0
exit
! Set the IP addres and enable OSPF on lo interface
interface lo
 ip address 1.1.1.4/32
 ip ospf area 0
exit
! Enable a routing process BGP with AS number 1
router bgp 1
 ! Specify a BGP neighbor with AS number 1
 neighbor 1.1.1.1 remote-as 1
 ! Communicate with a neighbor through lo interface
 neighbor 1.1.1.1 update-source lo
 ! Enable the Address Family for neighbor 1.1.1.1 and advertise all local VNIs
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
exit
! Enable a routing process OSPF
router ospf
exit
EOF
```




Then, still in vtysh, check devices can communicate :
```do sh ip rout``` (check vid at 9:33)
```do sh bgp summary``` (9:37)
```do sh bgp l2vpn evpn``` (9:58)



## boot host machine1, then machine3, then machine2 (13:03)

host machine 1
ip addr add 20.1.1.1/24 dev eth1

host machine 2
ip addr add 20.1.1.2/24 dev eth0

host machine 3
ip addr add 20.1.1.3/24 dev eth0

