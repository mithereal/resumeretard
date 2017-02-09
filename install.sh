#!/bin/bash
STARTDIR=$(pwd)
VERSION=0.8.12
DESTINATION_HELP='-d Chicago Boss destination path'
VERSION_HELP='-v sets the Chicago Boss Project version'
OVERWRITE_HELP='-u will overwrite if ChicagoBoss exists and install in default dir ChicagoBoss (skips versioning, aka upgrade)'
PROJECT_NAME='Resume Retard'
CREATOR='Jason Clark <mithereal@gmail.com>'
function install()
{
  if [ -z "$COMPILERDIR" ]
then
  echo "Enter the Chicago Boss Dir (if no dir is selected we will download ChicagoBoss into $HOME/ChicagoBoss-${VERSION})"
  read COMPILERDIR
fi


if [[ 1 > ${#COMPILERDIR} ]]
then
CBBDIR=${HOME}
else
CBBDIR=${COMPILERDIR}
fi

## fetch and install chicagoboss
cd ${CBBDIR}
wget https://github.com/ChicagoBoss/ChicagoBoss/releases/v"${VERSION}".tar.gz
tar -xvzf v"${VERSION}".tar.gz

if [ -z "$OVERWRITE" ]
then
cd ChicagoBoss-"${VERSION}"
else
rm -drf ChicagoBoss
mv ChicagoBoss-"${VERSION}" ChicagoBoss
cd ChicagoBoss
fi

COMPILERDIR=$(pwd)

echo "...Building Chicago Boss..."
make
cd ${STARTDIR}
#sed s_{path, \".*/ChicagoBoss.[[:digit:]]*.[[:digit:]]*.[[:digit:]]*_{path, \"${COMPILERDIR}_ rebar.config > rebar.config # may be needed in some cases
./rebar get-deps compile
}

function help()
{
    echo ""
    echo "$PROJECT_NAME Installer by $CREATOR"
    echo ""
    echo "Usage: install $DESTINATION_HELP "
    echo $VERSION_HELP
}

while getopts ":d:?:v" opt; do
    case $opt in
        d)
            COMPILERDIR=$OPTARG
            ;;
        v)
            VERSION=$OPTARG
            ;;
        u)
            OVERWRITE=$OPTARG
            ;;
        ?)
            help
exit 0
            ;;
    esac
done

install
