#!/bin/bash
SCRIPT_NAME=$0
SCRIPT_PATH=`realpath ${SCRIPT_NAME}`
SCRIPT_ROOT_PATH=$(cd "$(dirname "${SCRIPT_PATH}")";cd ..;pwd)

. ${SCRIPT_ROOT_PATH}/libs/common.sh

# Load properties configurations to env variables:
. ${LOAD_PROPERIES_TO_ENV} ${SCRIPT_ROOT_PATH}/module_a/config/a_config.properties


function usage(){
    echo "Usage:"
    echo -e "\t$0 create # Create example"
    echo -e "\t$0 delete # Delete example"
}

function actionCreate(){
    info "actionCreate..."

    # log variables which oad from properties file:
    info "A_VERSION=${A_VERSION}"
}

function actionDelete(){
    info "actionDelete..."
    # TO-DO:...
}

############################################
# main
#

action=$1

if [ "X$action" == "Xcreate" ]; then
    console "Start to create..."

    actionCreate

    console "Create successful."

elif [ "X$action" == "Xdelete" ]; then
    console "Start to create..."

    actionDelete

    console "Delete successful."
else
    error "Error: parameters not valid!"
    usage
fi
