# Getting started
## Dependencies
- GNU Make (`make` Debian's package)
- [Docker Compose](https://github.com/docker/compose) (v2 and higher)

In your `/etc/docker/daemon.json`, make sure to enable ipv6 and buildkit. Here is the config I use:
```json
{
	"storage-driver": "btrfs",
	"ipv6": true,
	"fixed-cidr-v6": "fd00:d0cc:e700:defa::/64",
	"default-address-pools": [
		{
			"base": "10.0.0.0/8",
			"size": 24
		},
		{
			"base": "fd00:d0cc:e700:1111::/64",
			"size": 80
		}
	],
	"features": {
		"buildkit": true
	}
}
```

- `golang` (I use version 2:1.19~1 from Debian bullseye), to build NextMN-SRv6.

## Run

```text
# Start containers and install NextMN-SRv6
# You must have the cloned and build https://github.com/nextmn/srv6 in ../nextmn-srv6/
$ make u

# Start NextMN-SRv6 on each node
# Currently, this is manual
$ make s/srgw
$ make s/rr
$ make s/r0
$ make s/r1
$ make s/gnb-ul1
$ make s/gnb-ul2
$ make s/gnb-dl

# Enter debug container of ue1
$ make t/ue1

# Stop containers
$ make d
```
# Tesbed
Each UE use it's own GTP TEID. The SRGW create a different SRH depending on the TEID.
Rn is a border gateway of the edge n.
Sn is an instance of S in the edge n.
![Testbed simplified](./images/testbed_simplified.svg)

We use SRv6 functions to emulate a gNB that will use different TEID per UE.
![Testbed full](./images/testbed_full.svg)
