#!/bin/bash

SCRIPT_NAME=$0
SCRIPT_PATH=`realpath ${SCRIPT_NAME}`
SCRIPT_ROOT_PATH=$(cd "$(dirname "${SCRIPT_PATH}")";pwd)

. ${SCRIPT_ROOT_PATH}/libs/common.sh

# Load main properties configurations to env variables:
. ${LOAD_PROPERIES_TO_ENV} ${SCRIPT_ROOT_PATH}/config/main.properties


DRYRUN=false
TARGET=all

export SCRIPT_ROOT=${SCRIPT_ROOT_PATH}

function usage(){
    echo ""
    echo "Usage:"
    echo "    . Create:"
    echo "      $0 create -t|--target target [-d|--dryrun true|false]"
    echo "    . Delete:"
    echo "      $0 delete  -t|--target target [-d|--dryrun true|false]"
    echo "    . Show help:"
    echo "      $0 -h|--help"
    echo " "
    echo "    Options:"
    echo "        -t|--target: action target: all|lab, split by ',' for multiple target"
    echo "        -d|--dryrun:"
    echo "            true : Dry run"
    echo "            false: Default value, Real run"
    echo ""
}

function actionDryRun(){
    info "actionDryRun..."

    if [ "X$ACTION" == "Xcreate" ]; then
        console ""
        console "===================== Create Start ======================"
        console ""

        console ""
        console "====================== Create Done ======================="
        console ""

    elif [ "X$ACTION" == "Xdelete" ]; then
        console ""
        console "===================== Delete Start ======================"
        console ""
        console ""
        console "====================== Delete Done ======================="
        console ""

    else
        error "Arguments not right!"
        usage
        exit 1
    fi
}

function actionCreate(){
    info "actionCreate..."

    if [[ "$TARGET" =~ "targetA" ]]; then
        info "Create Target A"
    fi
    if [[ "$TARGET" =~ "targetB" ]]; then
        info "Create Target B"
    fi

    # call modules:
    ${SCRIPT_ROOT_PATH}/module_a/main.sh create

    # TO-DO:...
}

function actionDelete(){
    info "actionDelete..."

    if [[ "$TARGET" =~ "targetA" ]]; then
        info "Delete Target A"
    fi
    if [[ "$TARGET" =~ "targetB" ]]; then
        info "Delete Target B"
    fi

    # call modules:
    ${SCRIPT_ROOT_PATH}/module_a/main.sh delete

    # TO-DO:...
}

##############################################
## main
## 

info "$0 $*"
if [ $# -lt 1 ]; then
    usage
    exit 1
fi

ACTION=$1
if [ "X$ACTION" == "X-h" ] || [ "X$ACTION" == "X--help" ]; then
    usage
    exit 0
fi

shift # Ignore action argument
# Parse arguments:
until [ $# -eq 0 ]
do
    case "$1" in
        -d | --dryrun ) export DRYRUN=$2; shift 2;;
        -t | --target ) export TARGET=$2; shift 2;;
        -h | --help ) export ACTION=help; shift 2;;
        *) shift; error "Unknow argument: $1";;
    esac
done

info ""
info "ACTION=${ACTION}"
info "TARGET=${TARGET}"
info "DRYRUN=${DRYRUN}"

# dry run: 
if [ "X${DRYRUN}" == "Xtrue" ]; then
    actionDryRun
    exit 0
fi

# real run:
if [ "X$ACTION" == "Xcreate" ]; then

    console ""
    console "===================== Create Start ======================"
    console ""

    actionDelete

    console ""
    console "====================== Create Done ======================="
    console ""

elif [ "X$ACTION" == "Xdelete" ]; then

    console ""
    console "===================== Delete Start ======================"
    console ""

    actionDelete

    console ""
    console "====================== Delete Done ======================="
    console ""

else
    error "Arguments not right!"
    usage
    exit 1
fi

