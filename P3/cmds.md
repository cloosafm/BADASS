# P3 - EVPN

## only start the 4 routers
then do config for router 2, then r1, r3 and finally r4

## router 1
Directly go into vtysh mode :
```vtysh```

```conf t```

then paste the following :
```sh
hostname _acloos-1
no ipv6 forwarding
!
interface eth0
 ip address 10.1.1.1/30
!
interface eth1
 ip address 10.1.1.5/30
!
interface eth2
 ip address 10.1.1.9/30
!
interface lo
 ip address 1.1.1.1/32
!
router bgp 1
 neighbor ibgp peer-group
 neighbor ibgp remote-as 1
 neighbor ibgp update-source lo
 bgp listen range 1.1.1.0/29 peer-group ibgp
 !
 address-family l2vpn evpn
  neighbor ibgp activate
  neighbor ibgp route-reflector-client
 exit-address-family
!
router ospf
 network 0.0.0.0/0 area 0
!
line vty
!
```



## router 2
first paste the following in the aux console :
```sh
ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth1
```

then go into vtysh mode :
```vtysh```

```conf t```

then paste the following :
```sh
hostname _acloos-2
no ipv6 forwarding
!
interface eth0
 ip address 10.1.1.2/30
 ip ospf area 0
!
interface lo
 ip address 1.1.1.2/32
 ip ospf area 0
!
router bgp 1
 neighbor 1.1.1.1 remote-as 1
 neighbor 1.1.1.1 update-source lo
 !
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
!
router ospf
!
```

## router 3
Directly go into vtysh mode :
```vtysh```

```conf t```

then paste the following :
```sh
hostname _acloos-3
no ipv6 forwarding
!
interface eth1
 ip address 10.1.1.6/30
 ip ospf area 0
!
interface lo
 ip address 1.1.1.3/32
 ip ospf area 0
!
router bgp 1
 neighbor 1.1.1.1 remote-as 1
 neighbor 1.1.1.1 update-source lo
 !
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
 exit-address-family
!
router ospf
```



## router 4
first paste the following in the aux console :
```sh
ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth0
```

then go into vtysh mode :
```vtysh```

```conf t```

then paste the following :
```sh
hostname _acloos-4
no ipv6 forwarding
!
interface eth2
 ip address 10.1.1.10/30
 ip ospf area 0
!
interface lo
 ip address 1.1.1.4/32
 ip ospf area 0
!
router bgp 1
 neighbor 1.1.1.1 remote-as 1
 neighbor 1.1.1.1 update-source lo
 !
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
!
router ospf
!
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
