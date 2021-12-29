<!--
  Copyright 2021 Hayden Young. All rights reserved.
  Use of this source code is governed by a BSD-style
  license that can be found in the LICENSE file.
-->

# KVM Lab

My Homelab setup using KVM scripts to bootstrap some testing infrastructure.

## Setup

```sh
# download install isos
./download_iso.sh

# set up libvirt networks
sudo ./create_networks.sh

# left side network hosts
sudo ./create_vm.sh vpn01 8 network=vpc01
sudo ./create_vm.sh svc01 8 network=vpc01

# right side network hosts
sudo ./create_vm.sh vpn02 8 network=vpc02
sudo ./create_vm.sh svc02 8 network=vpc02
```

## Customizing

### Changing the default user password

In the `00-base.ks` file, you will see the `user` directive which includes
`--username` and `--password`. To change these, set the `--username` argument
as normal, and generate a new encrypted password with `python`.

```shell
[hayden@hayden-pc kickstarts]$ python -c 'import crypt,getpass;pw=getpass.getpass();print(crypt.crypt(pw) if (pw==getpass.getpass("Confirm: ")) else exit())'
Password: <hidden>
Confirm: <hidden>
<hash output>
```
