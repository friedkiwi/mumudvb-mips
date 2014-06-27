########!/bin/bash

export PATH="${PATH}:${HOME}/x-tools/mips-unknown-linux-uclibc/bin"
cd /home/ctngmips/mybuild2/


rm -rf dvb-apps-src
mkdir dvb-apps-src
wget "http://linuxtv.org/hg/dvb-apps/archive/tip.tar.gz" -O dvb-apps-src.tar.gz
tar -xzf dvb-apps-src.tar.gz -C dvb-apps-src --strip-components=1


rm -rf libdvbcsa-src
svn co svn://svn.videolan.org/libdvbcsa/trunk libdvbcsa
mv libdvbcsa libdvbcsa-src


rm -rf MuMuDVB
git clone https://github.com/braice/MuMuDVB.git


cd /home/ctngmips/mybuild2/


# Compiling dvb-apps/lib
cd /home/ctngmips/mybuild2/
cd dvb-apps-src/lib
make CC=mips-unknown-linux-uclibc-gcc
find . -type f -name "*.so*" -exec cp {} /home/ctngmips/x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/lib/ \;
find ../include/ -type f -exec cp {} /home/ctngmips/x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/include/ \;
cp -ra * /home/ctngmips/x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/include/


# Compiling libdvbcsa
cd /home/ctngmips/mybuild2/
cd libdvbcsa-src
autoreconf -i -f
./configure --host=mips-unknown-linux-uclibc --prefix=/home/ctngmips/mybuild2/libdvbcsa-src
make
make install
find lib/ -type f -name "*.so*" -exec cp {} /home/ctngmips/x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/lib/ \;
cp -ra include/* /home/ctngmips/x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/include/
mv /home/ctngmips/x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/lib/libdvbcsa.so.1.0.1 /home/ctngmips/x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/lib/libdvbcsa.so

export PATH="${PATH}:${HOME}/x-tools/mips-unknown-linux-uclibc/bin"


# Exporting INCLUDE
#export CPPFLAGS="${CPPFLAGS} -I/home/ctngmips/mybuild2/dvb-apps-src/include"
#export CPPFLAGS="${CPPFLAGS} -I/home/ctngmips/mybuild2/libdvbcsa-src/include"

# Exporting LIB
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/libdvbapi"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/libdvbcfg"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/libdvben50221"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/libdvbmisc"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/libdvbsec"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/libesg"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/dvb-apps-src/lib/libucsi"
#export LDFLAGS="${LDFLAGS} -L/home/ctngmips/mybuild2/libdvbcsa-src/lib"


#find dvb-apps-src/lib/ -type f -name "*.so*" -exec cp {} ../x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/lib/ \;
#find dvb-apps-src/include/ -type f -exec cp {} ../x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/include/ \;
#find libdvbcsa-src/lib/ -type f -name "*.so*" -exec cp {} ../x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/lib/ \;
#find libdvbcsa-src/include/ -type f -name "*.so*" -exec cp {} ../x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/include/ \;
#cp -ra dvb-apps-src/lib/* ../x-tools/mips-unknown-linux-uclibc/mips-unknown-linux-uclibc/include/


# Compiling MuMuDVB
cd /home/ctngmips/mybuild2/
cd MuMuDVB
autoreconf -i -f
./configure --host mips-unknown-linux-uclibc

# Renaming binary
sed -ir 's/PACKAGE = mumudvb/PACKAGE = mumudvb-mips/' src/Makefile

make

