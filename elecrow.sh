#/usr/bin/env bash

# rename and compress gerber file for elecrow
set -e
GERBER_DIR=./gerber
if [ $# != 1 ]; then
  echo "usage $(basename $0) pcbname"
  exit 1
fi
PCB_NAME=$1
mv -v "${GERBER_DIR}/${PCB_NAME}-F_Cu.gtl" "${GERBER_DIR}/${PCB_NAME}.GTL"
mv -v "${GERBER_DIR}/${PCB_NAME}-B_Cu.gbl" "${GERBER_DIR}/${PCB_NAME}.GBL"
mv -v "${GERBER_DIR}/${PCB_NAME}-F_Mask.gts" "${GERBER_DIR}/${PCB_NAME}.GTS"
mv -v "${GERBER_DIR}/${PCB_NAME}-B_Mask.gbs" "${GERBER_DIR}/${PCB_NAME}.GBS"
mv -v "${GERBER_DIR}/${PCB_NAME}-F_SilkS.gto" "${GERBER_DIR}/${PCB_NAME}.GTO"
mv -v "${GERBER_DIR}/${PCB_NAME}-B_SilkS.gbo" "${GERBER_DIR}/${PCB_NAME}.GBO"
mv -v "${GERBER_DIR}/${PCB_NAME}-Edge_Cuts.gm1" "${GERBER_DIR}/${PCB_NAME}.GML"
for drl in ${GERBER_DIR}/${PCB_NAME}-*.drl; do
  mv -v $drl ${drl%.drl}.TXT
done

cd $GERBER_DIR
zip ${PCB_NAME}.zip ${PCB_NAME}.* ${PCB_NAME}-*
