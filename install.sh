#!/bin/bash
STARTDIR=$(pwd)
VERSION=0.8.10
echo "Enter the Chicago Boss Dir (if no dir is selected we will download chicagoboss into $HOME/chicagoboss)"
read COMPILERDIR

if [ "${COMPILERDIR}" > 3 ]
then
cd ${COMPILERDIR}
else
## fetch and install chicagoboss
cd ~
wget https://github.com/ChicagoBoss/ChicagoBoss/archive/v"${VERSION}".tar.gz
tar -xvzf v"${VERSION}".tar.gz
fi

cd ChicagoBoss-"${VERSION}"
COMPILERDIR=$(pwd)
echo "...Building Chicago Boss..."
make
cd ${STARTDIR}

sed s_/home/mithereal/ChicagoBoss.[[:digit:]]*.[[:digit:]]*.[[:digit:]]*_${COMPILERDIR}_ boss.config > boss.config
sed s_/home/mithereal/ChicagoBoss.[[:digit:]]*.[[:digit:]]*.[[:digit:]]*_${COMPILERDIR}_ rebar.config > rebar.txt
./rebar get-deps compile


