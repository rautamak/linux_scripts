#!/bin/bash

SDAT2IMG=~/sdat2img.py
LINEAGE_ROOT=~/lineage-18.0/

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -z|--zip)
    ZIP="$2"
    shift
    shift
    ;;
    -d|--dir)
    DIR="$2"
    shift
    shift
    ;;
esac
done
set -- "${POSITIONAL[@]}"

[[ "${DIR}" == */ ]] && STR="${DIR: : -1}"

mkdir ${DIR}

IFS='_' read -r -a array <<< "${ZIP}"
echo "${array[0]}"

if [ "${array[0]}" = "OnePlus5Oxygen" ]; then
    DEVICE_DIR="${LINEAGE_ROOT}device/oneplus/cheeseburger/"
    echo "Device: Oneplus 5"
    echo "Device dir: ${DEVICE_DIR}"
else
    DEVICE_DIR="${LINEAGE_ROOT}device/oneplus/dumpling/"
    echo "Device: Oneplus 5T"
    echo "Device dir: ${DEVICE_DIR}"
fi

echo "Setting board-info.txt"
ack 'Time_Stamp' NON-HLOS.bin
echo "require version-modem=" > test.txt
#"${DEVICE_DIR}/board-info.txt"
#unzip -o ${ZIP} firmware-update/* \
#    -d ${DIR} || { echo 'Unzipping failed' ; exit 1; }
