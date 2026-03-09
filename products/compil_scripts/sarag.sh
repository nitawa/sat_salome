#!/bin/bash

echo "##########################################################################"
echo "SARAG" $VERSION
echo "##########################################################################"

LINUX_DISTRIBUTION="$DIST_NAME$DIST_VERSION"
mkdir -p "${PRODUCT_INSTALL}"
cd "${PRODUCT_INSTALL}"
${PYTHONBIN} -m venv ${PRODUCT_INSTALL}

source ${PRODUCT_INSTALL}/bin/activate
cd ${SOURCE_DIR}
${PRODUCT_INSTALL}/bin/pip3 install .
if [ $? -ne 0 ]; then
    echo "FATAL: could not install chatbot assistant"
    exit 1
fi
cp ${SOURCE_DIR}/salome-assistant.sh ${PRODUCT_INSTALL}/bin/salome-assistant.sh
if [ $? -ne 0 ]; then
    echo "FATAL: could not find salome-assistant.sh"
    exit 2
fi

chmod 755 ${PRODUCT_INSTALL}/bin/salome-assistant.sh

echo
echo "########## END"
