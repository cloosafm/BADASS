# Hosts configuration

All commands are to be done in bash.
First we reset all IP addresses on the ports we will use, to make sure we won't have any conflict. Then we configure the IP address.

## host 1
```sh
bash
ip address flush dev eth1
ip addr add 20.1.1.1/24 dev eth1
```

# host 2
```sh
bash
ip address flush dev eth0
ip addr add 20.1.1.2/24 dev eth0
```

# host 3
```sh
bash
ip address flush dev eth0
ip addr add 20.1.1.3/24 dev eth0
```
