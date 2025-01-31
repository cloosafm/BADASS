# BADASS

We'll have to a simulate a network using GNS3 and docker, focusing on advanced networking concepts like BGP (Border Gateway Protocol), EVPN (Ethernet VPN), and VXLAN (Virtual Extensible LAN). 

## DURING CORRECTION
1- ./image_builder.sh
2- import portable project (P1.gns3project)
3- start/resume all nodes
4- explanations

## Understanding Concepts 

- `BGP (Border Gateway Protocol)`: The protocol that drives the internet, used for routing data between autonomous systems. 
En gros, un protocole de routage externe qui connecte differents systemes autonomes et gere les routes sur internet.

- `MP-BGP (Multi-Protocol BGP)`: An extension of BGP that supports multiple address families, such as IPv6, VPNs, and EVPN. 
En gros, une extension de BGP permettant de gerer plusieurs types d'adresses (IPv6, VPN, EVPN) pour des communications flexibles.

- `EVPN (Ethernet VPN)`: A BGP address family that allows for Layer 2 VPNs over Layer 3 networks, facilitating MAC address learning and distribution. 
En gros, Un type d'adresse BGP qui permet de créer des VPN au niveau 2 (Ethernet) au-dessus de réseaux de niveau 3, en distribuant les adresses MAC.

- `VXLAN (Virtual Extensible LAN)`: A tunneling protocol that encapsulates Layer 2 frames within UDP packets, allowing for Layer 2 segments over Layer 3 networks. 
En gros, un protocole de tunneling qui transporte des segments de réseau de niveau 2 via des réseaux de niveau 3 grâce à l'encapsulation dans des paquets UDP.

- `OSPF (Open Shortest Path First)`: A routing protocol used within an autonomous system. 
En gros, un protocole de routage interne conçu pour trouver le chemin le plus court dans un réseau autonome, couche 2

- `IS-IS (Intermediate System to Intermediate System)`: Another interior gateway protocol for routing within an autonomous system. En gros, un protocole de routage interne, souvent utilisé dans les grands réseaux comme ceux des opérateurs télécoms, couche 2.

## Tools

- `Wireshark` : Open-Source Analysor of network packets. We can capture and inspect data on a network in real time. it use for: 
    - Identify communications problems
    - Security analysis
    - Protocol analysis

- `Dynamips`: Cisco rooter emulator for simulation. it use for:
    - Network simulation

- `GNS3`: Graphical Network Simulator-3, simulate complex networks with rooter, commutator and other virtual disposifs. it use for: 
    - Simulation : 
    - Graphical Interface 
    - Integration with other tool

- `GNS3 ubridge`: bridge on GNS3 use for network interface connection. it use for: 
    - link virtual interface to physical interface
    - treat network packets
    - optimisation of packets transmission

- `xterm`: terminal emulator, for GNS3 dispositif network simulation

## 2 images

1. Image with busybox
    - Use `Alpine Linux` as it's lightweight and suitable for network tasks.
    - Include bash and busybox, which is `Unix utilies` in a single executable file.

2. Image with Routing Capabilities
    - Use a Linux distribution of your choice (e.g., Ubuntu, Debian) or directly frr/routing directly.
    - `FRRouting (FRR)`: An open-source routing software suite that supports BGP, OSPF, and IS-IS.
    - Installation:
        - Add the FRR repository and install using package manager.
        - Configure `FRR daemons` (bgpd, ospfd, isisd) with the `daemons.conf` in the router folder.
        - Include BusyBox or equivalent for basic utilities.

3. Test images locally

## Configuration of GNS3 with docker images

- Add Docker Images to GNS3:
    - Open GNS3 and go to `Preferences > Docker Containers.`
    - Add new templates using your Docker images.
        - Start command : `/bin/sh`
        - `telnet`

## Simple Network Setup

Objective: Create a simple network with two machines using your Docker images.

- Drag and drop your Docker containers into the GNS3 workspace.
- Connect the containers using GNS3's network links.
- Ensure that both machines are operationnal with `Right Click` + `Auxiliary Console` : `ps` and `hostname` cmds.


