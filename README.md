## MuMuDVB-MIPS

### About

MuMuDVB Autobuilding with Crosstool-ng and drone.io to MIPS Arch
I only maintain in this repo:
- Crosstool-ng MIPS Toolchain
- drone.io autobuild script and related stuff
- opkg package creation for OpenWRT ar71xx specific systems

## Download MuMuDVB binary
### MuMuDVB with CAM/SCAM support
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/MuMuDVB/src/mumudvb-mips

#### ./configure features
```
MuMuDVB configure results:

Features

Build with CAM support:                             yes
Build with SCAM support:                            yes
Build with ATSC long names support:                 yes
Build with compatibility for android:                no
```

### Download necessary libraries
```
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libucsi.so
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvben50221.so
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvbcsa.so.1
https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/libdvbapi.so
```

### Manual Setup on OpenWRT
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

### IPK package for OpenWRT Barrier Breaker (BB)
**AR71xx only**

https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/mumudvb-mips_1.0.0-1_ar71xx.ipk

Well known AR71xx routers:
- TP-LINK WR1043ND
- TP-LINK WDR3600 (tested)

```bash
# wget or scp from your local machine to your router's /root directory
#
# wget https://drone.io/github.com/Gorkhaan/mumudvb-mips/files/artifacts/mumudvb-mips_1.0.0-1_ar71xx.ipk -O /root/mumudvb-mips_1.0.0-1_ar71xx.ipk

# Install mumudvb-mips with opkg
opkg install mumudvb-mips_1.0.0-1_ar71xx.ipk
```

```bash
root@OpenWrt:~# mumudvb-mips
MuMuDVB is a program who can redistribute stream from DVB on a network, in multicast or in http unicast.
It's main feature is to take a whole transponder and put each channel on a different multicast IP.

Usage: mumudvb [options]
-c, --config : Config file
-s, --signal : Display signal power
-t, --traffic : Display channels traffic
-l, --list-cards : List the DVB cards and exit
--card       : The DVB card to use (overrided by the configuration file)
--server_id  : The server id (for autoconfiguration, overrided by the configuration file)
-d, --debug  : Don't deamonize
-v           : More verbose
-q           : Less verbose
--dumpfile   : Debug option : Dump the stream into the specified file
-h, --help   : Help

MuMuDVB Version 1.7.3_20131116_master
 --- Build information ---
Built with CAM support.
Built with SCAM support.
Built with ATSC support.
Built with ATSC long channel names support.
Built with support for DVB API Version 5.6.
Built with support for DVB-T2.
---------
Originally based on dvbstream 0.6 by (C) Dave Chapman 2001-2004
Released under the GPL.
Latest version available from http://mumudvb.braice.net/
Project from the cr@ns (http://www.crans.org)
by Brice DUBOST (mumudvb@braice.net)

root@OpenWrt:~# ldd mumudvb-mips
        libm.so.0 => /lib/libm.so.0 (0x7776a000)
        libdvbcsa.so.1 => /lib/libdvbcsa.so.1 (0x77744000)
        libdvben50221.so => /lib/libdvben50221.so (0x77713000)
        libucsi.so => /lib/libucsi.so (0x776e5000)
        librt.so.0 => /lib/librt.so.0 (0x776d1000)
        libpthread.so.0 => /lib/libpthread.so.0 (0x776ab000)
        libdvbapi.so => /lib/libdvbapi.so (0x77694000)
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x77670000)
        libc.so.0 => /lib/libc.so.0 (0x77603000)
        libdl.so.0 => /lib/libdl.so.0 (0x775ef000)
        ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x77790000)
root@OpenWrt:~#
```
