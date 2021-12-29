#!/usr/bin/env bash
# Copyright 2021 Hayden Young. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

network_files=(vpc01 vpc02)

function network_config() {
  name=$1

  virsh net-destroy ${name} || true
  virsh net-create --file ./networks/${name}.xml
}

for file in ./networks/*; do
  name=$(echo $file | sed 's/.\/networks\///' | sed 's/.xml//')
  echo "Processing network $name..."
  network_config $name
done
