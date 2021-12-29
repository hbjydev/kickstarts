<!--
  Copyright 2021 Hayden Young. All rights reserved.
  Use of this source code is governed by a BSD-style
  license that can be found in the LICENSE file.
-->

# KVM Lab

My Homelab setup using KVM scripts to bootstrap some testing infrastructure.

## Setup

```sh
# set up libvirt networks
sudo ./create_networks.sh

# download install isos
sudo ./download_iso.sh

# left side network
sudo ./create_vm.sh vpn01 8 network=vpc01
sudo ./create_vm.sh svc01 8 network=vpc01

# right side network
sudo ./create_vm.sh vpn02 8 network=vpc02
sudo ./create_vm.sh svc02 8 network=vpc02
```
