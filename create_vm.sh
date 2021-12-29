#!/usr/bin/env bash
# Copyright 2021 Hayden Young. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

## VARIABLES
MEM_SIZE=2048       # memory (MiB)
VCPUS=1             # core count
OS_VARIANT="rhl8.0" # find with osinfo-query

# installer ISO path
ISO_FILE="/home/hayden/Downloads/Rocky-8.5-x86_64-minimal.iso"
## END VARIABLES

OS_TYPE="linux"

echo -en "Enter VM name: "
read VM_NAME

echo -en "Enter virtual disk size: "
read DISK_SIZE

virt-install \
  --name=${VM_NAME} \
  --memory=${MEM_SIZE} \
  --vcpus=${VCPUS} \
  --os-type=${OS_TYPE} \
  --location=${ISO_FILE} \
  --disk size=${DISK_SIZE} \
  --network bridge=virbr0 \
  --graphics=none \
  --os-variant=${OS_VARIANT} \
  --console pty,target_type=serial \
  --initrd-inject 00-base.ks \
  --extra-args "inst.ks=file:/ks.cfg console=tty0 console=ttyS0,115200n8"
