#!/usr/bin/env bash
# Copyright 2021 Hayden Young. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

network_files=(vpc01 vpc02)

for file in ${network_files[@]}; do
  virsh net-destroy ${file} || true
  virsh net-create --file networks/${file}.xml
done
