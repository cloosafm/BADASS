# Hosts configuration

All commands are to be done in bash.

## reset network conf
```sh
ip address flush dev eth0
ip address flush dev eth1
```

## host 1
```sh
ip addr add 20.1.1.1/24 dev eth1
```

# host 2
```sh
ip addr add 20.1.1.2/24 dev eth0
```

# host 3
```sh
ip addr add 20.1.1.3/24 dev eth0
```
