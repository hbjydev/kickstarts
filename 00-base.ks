######
# Environment
######

text
cdrom
auth --enableshadow --passalgo=sha512
keyboard --vckeymap=uk --xlayouts=gb
lang en_GB.UTF-8
eula --agreed
skipx
reboot --eject


######
# Networking & Time
######

network --bootproto=dchp --noipv6 --onboot=on --device=eth0
timezone Europe/London


######
# Partitioning
######

bootloader --timeout=1 --location=mbr --append="net.ifnames=0 biosdevname=0"
zerombr
clearpart --all --initlabel
autopart --type=lvm

######
# User Accounts
######

user --groups=wheel --name=hayden --password="$1$e1PRmZTu$bpSJ1llzuXg2hOq2VeXfG0" --gecos="Hayden Young"


######
# Security (SELinux & FirewallD)
######

selinux --enforcing
firewall --enabled --ssh


######
# Software
######

%packages --ignoremissing --excludedocs --instLangs=en_GB.UTF-8
@core
@base
bash-completion
sudo
tar
bzip2
rsync
net-utils
%end
