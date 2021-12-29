######
# Environment
######

text
cdrom
keyboard --vckeymap=uk --xlayouts=gb
lang en_GB.UTF-8
eula --agreed
skipx
reboot --eject


######
# Networking & Time
######

network --bootproto=dhcp --noipv6 --onboot=on --device=eth0
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

user --groups=wheel --name=hayden --iscrypted --password=$6$/H1oylk4WEQs/c47$a2rELZgN7G4n0bKpT44KCl3ozs20PEmqtR0s.HWsmYlbn1GQ/H51nEqRo6I2Pp.EJOvaisZolUMQ3ve7fXXia/ --gecos="Hayden Young"


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
