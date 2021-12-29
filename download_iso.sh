#!/usr/bin/env bash
# Copyright 2021 Hayden Young. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

. ./vars.sh

function download_rocky() {
  echo "Downloading Rocky Linux $1.$2..."

  url="https://download.rockylinux.org/pub/rocky/$1/isos/x86_64/Rocky-$1.$2-x86_64-minimal.iso"

  mkdir -p static
  curl -L#o static/rocky-$1.$2.iso $url
}

download_rocky $RL_MAJOR $RL_MINOR
