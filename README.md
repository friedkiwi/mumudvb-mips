# MuMuDVB-MIPS

## About

MuMuDVB Autobuilding with Crosstool and drone.io to MIPS Arch
I only maintain the Crosstool-ng MIPS Toolchain and the autobuild script on drone.io

## Download MuMuDVB binary
### MuMuDVB with CAM/SCAM support
`https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/MuMuDVB/src/mumudvb-mips-cam`

### ./configure features
```
MuMuDVB configure results:

Features

Build with CAM support:                             yes
Build with SCAM support:                            yes
Build with ATSC long names support:                 yes
Build with compatibility for android:                no
```

## Download necessary libraries
```
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libucsi.so
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvben50221.so
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvbcsa.so.1
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvbapi.so
```

## Setup on OpenWRT
```bash
root@OpenWrt:~# uname -a
Linux OpenWrt 3.10.36 #1 Wed Jun 25 04:02:02 UTC 2014 mips GNU/Linux
root@OpenWrt:~#
```

```bash
wget -q "https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/mumudvb-mips" -O mumudvb-mips
wget -q "https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libucsi.so" -O libucsi.so
wget -q "https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvben50221.so" -O libdvben50221.so
wget -q "https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvbcsa.so.1" -O libdvbcsa.so.1
wget -q "https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvbapi.so" -O libdvbapi.so

scp libucsi.so libdvben50221.so libdvbcsa.so.1 libdvbapi.so root@192.168.123.1:/lib/
scp mumudvb-mips root@192.168.123.1:/root/
```
