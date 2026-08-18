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
${PRODUCT_INSTALL}/bin/pip3 install . --extra-index-url https://download.pytorch.org/whl/cpu
if [ $? -ne 0 ]; then
    echo "FATAL: could not install chatbot assistant"
    exit 1
fi
cp ${SOURCE_DIR}/salome-assistant.sh ${PRODUCT_INSTALL}/bin/salome-assistant.sh
if [ $? -ne 0 ]; then
    echo "FATAL: could not find salome-assistant.sh"
    exit 2
fi

cp -r ${SOURCE_DIR}/raglib ${PRODUCT_INSTALL}/lib/python${PYTHON_VERSION}/site-packages/raglib
if [ $? -ne 0 ]; then
    echo "FATAL: could not copy raglib"
    exit 3
fi

# Ship the example config (used as the default when no user config exists at
# ~/.config/salome/chatbot.config.json) and the chat icon next to the modules.
cp ${SOURCE_DIR}/config.example.json ${PRODUCT_INSTALL}/lib/python${PYTHON_VERSION}/site-packages/config.example.json
if [ $? -ne 0 ]; then
    echo "FATAL: could not copy config.example.json"
    exit 4
fi
cp ${SOURCE_DIR}/salome.jpg ${PRODUCT_INSTALL}/lib/python${PYTHON_VERSION}/site-packages/salome.jpg 2>/dev/null || true

chmod 755 ${PRODUCT_INSTALL}/bin/salome-assistant.sh

echo
echo "########## END"
