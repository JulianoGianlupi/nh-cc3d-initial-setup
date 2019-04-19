#!/bin/sh

# CC3D_DEMO_NAME=VascularTumor
# CC3D_DEMO_FILENAME=VascularTumor.cc3d
CC3D_DEMO_PREFIX=Demos/
USER_DEMO_PATH=$HOME/CompuCell3D_Demos/

# necessary to enforce standard convention for numeric values specification on non-English OS
export LC_NUMERIC="C.UTF-8"

export PREFIX_CC3D=/apps/compucell3d/current/CompuCell3D

PYTHON_EXEC=/usr/bin/python

export MAX_NUMBER_OF_CONSECUTIVE_RUNS=50

export COMPUCELL3D_PLUGIN_PATH=${PREFIX_CC3D}/lib/CompuCell3DPlugins
export COMPUCELL3D_STEPPABLE_PATH=${PREFIX_CC3D}/lib/CompuCell3DSteppables

export LD_LIBRARY_PATH=${COMPUCELL3D_STEPPABLE_PATH}:${COMPUCELL3D_PLUGIN_PATH}:${PREFIX_CC3D}/lib/python:${PREFIX_CC3D}/lib:${VTK_LIB_DIR}:${LD_LIBRARY_PATH}
export SWIG_LIB_INSTALL_DIR=${PREFIX_CC3D}/lib/python
export PYTHON_MODULE_PATH=${PREFIX_CC3D}/pythonSetupScripts

export DEMO_PATH=${PREFIX_CC3D}/$CC3D_DEMO_PREFIX
echo ${DEMO_PATH}

echo "Setting user files"
echo ${USER_DEMO_PATH}

mkdir -p ${USER_DEMO_PATH}

cp -r ${DEMO_PATH}/. ${USER_DEMO_PATH}/

COMPUCELL3D_MAJOR_VERSION=3
COMPUCELL3D_MINOR_VERSION=7
COMPUCELL3D_BUILD_VERSION=7

export SOSLIB_PATH=${PREFIX_CC3D}/examplesSoslib

echo "CompuCell3D - version $COMPUCELL3D_MAJOR_VERSION.$COMPUCELL3D_MINOR_VERSION.$COMPUCELL3D_BUILD_VERSION"

${PYTHON_EXEC} ${PREFIX_CC3D}/player5/compucell3d.pyw --currentDir=${PWD} > /dev/null 2>&1
exit_code=$?

exit ${exit_code}
