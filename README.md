# MuMuDVB-MIPS

## About

MuMuDVB Autobuilding with Crosstool and drone.io to MIPS Arch
I only maintain the Crosstool-ng MIPS Toolchain and the autobuild script on drone.io

## Download MuMuDVB binary
### MuMuDVB without CAM/SCAM support
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/MuMuDVB/src/mumudvb-mips

### MuMuDVB with CAM/SCAM support
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/MuMuDVB/src/mumudvb-mips-cam

## Download necessary libraries only for CAM/SCAM support
Only needed if you are using MuMuDVB with CAM/SCAM support
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

