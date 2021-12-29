#!/usr/bin/env bash
# Copyright 2021 Hayden Young. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

. ./vars.sh

## VARIABLES
MEM_SIZE=2048       # memory (MiB)
VCPUS=1             # core count
OS_VARIANT="rocky${RL_MAJOR}.${RL_MINOR}" # find with osinfo-query
## END VARIABLES

ISO_FILE="static/rocky-${RL_MAJOR}.${RL_MINOR}.iso"
OS_TYPE="linux"

VM_NAME="$1"
DISK_SIZE="$2"
VM_NETWORK="$3"

if [[ $VM_NAME == '' ]]; then
  echo -en "Enter VM name: "
  read VM_NAME
fi

if [[ $DISK_SIZE == '' ]]; then
  echo -en "Enter virtual disk size: "
  read DISK_SIZE
fi

if [[ $VM_NETWORK == '' ]]; then
  echo -en "Enter virtual network: "
  read VM_NETWORK
fi

virt-install \
  --name=${VM_NAME} \
  --memory=${MEM_SIZE} \
  --vcpus=${VCPUS} \
  --os-type=${OS_TYPE} \
  --location=${ISO_FILE} \
  --disk size=${DISK_SIZE} \
  --network=${VM_NETWORK} \
  --graphics=none \
  --os-variant=${OS_VARIANT} \
  --console="pty,target_type=serial" \
  --initrd-inject="00-base.ks" \
  --extra-args "inst.ks=file:/00-base.ks console=tty0 console=ttyS0,115200n8 net.ifnames=0"
