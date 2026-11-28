---
title: Debian Squeeze Vagrant Base Box
tags: [blog, devops]
layout: layout-post
---

In an effort to suck less at dealing with all the various sysadmin-related tasks
that come hand-in-hand with being a web developer, I'm learning my way around
Vagrant and Chef.

One of the many things I've been struggling with is the lack of a Debian Squeeze
vagrant box that actually works with my version of VirtualBox.

I'm not sure what the problem is here. One of the most common error messages
complained that the guest additions in the base box were from a different
version of VirtualBox from the one I'm using. If that's an issue, perhaps it
might be better if the likes of [virtualbox.es](https://virtualbox.es) made the
VirtualBox version of each box available.

Thing is, it's Debian Squeeze or nothing as far as I'm concerned, so the only
option remaining was to build my own base box. The documentation for this is
pretty great, but in the end I had to resort to a lot of Googling to figure
various things out so this blog post attempts to unite all the information I
needed in one place.

## 1. Install Debian in VirtualBox

I started by downloading
[`debian-6.0.6-i386-netinst.iso`](http://www.debian.org/releases/squeeze/debian-installer/)
from the Debian homepage. Following
[Vagrant's base box guidelines](http://vagrantup.com/v1/docs/base_boxes.html), I
created a virtual machine with the following properties:

- 40GB dynamically resizing drive
- 360MB of memory allocation
- Audio disabled
- USB disabled
- NAT networking

As per the recommendations, I chose a hostname of `vagrant-debian-squeeze` and a
domain of vagrantup.com.

## 2. Install Required Software

Vagrant requires Ruby, RubyGems, Puppet, Chef and an SSH server to be present on
the machine in order for it to work as a base box. To install these, I did this:

```bash
wget -O- http://opscode.com/chef/install.sh | bash
```

This is easier and more reliable than going through all the steps manually.

## 3. Remove Unwanted Software

Debian helpfully detects that you're installing it in VirtualBox and installs a
bunch of related packages for you. We don't want them though, and they have to
be removed in order to install the proper guest additions.

```bash
apt-get remove --purge virtualbox-ose-guest-x11
apt-get autoremove
apt-get remove --purge virtualbox-ose-guest-utils
```

This one was a pain to figure out. Much thanks to
[a blog post on revcode.wordpress.com](http://revcode.wordpress.com/2012/02/25/uninstalling-the-default-virtualbox-ose-guest-additions-on-debian/)
for the life-saving Google search result.

## 4. Install Guest Additions

There's a button in VirtualBox that effectively inserts the guest additions as
an imaginary CD-ROM. After pressing that, the commands to actually install them
were as follows:

```bash
apt-get install module-assistant
mount /media/cdrom
sh /media/cdrom/VBoxLinuxAdditions.run
```

After this it politely suggested a reboot, so I did.

## 5. Break All Security

This next bit felt so wrong. The standard Vagrant base box has a pretty funky
security model in order to make it convenient as a testing environment. The
guidelines stipulate passwordless sudo privileges, which entails installing sudo
and then immediately breaking off the locks.

```bash
apt-get install sudo sudo
visudo
```

The line I added to /etc/sudoers was %admin ALL=NOPASSWD: ALL, or in English,
"Everyone in the group called 'admin' can do anything they want to this box".
After that, I ran /etc/init.d/sudo restart to make it so.

## 6. Hand over the keys

The standard vagrant username is 'vagrant', with password 'vagrant'. I set this
user account up during Debian installation, but there was more to it than that.
The user must be added to the admin group.

```bash
groupadd admin
usermod -G admin vagrant
```

For good measure, I also decided to disable root login with passwd -l root.

## 7. Enable SSH access

In order to be able to access the vm with vagrant ssh, the guidelines recommend
using their standard
[insecure SSH key pair](http://github.com/mitchellh/vagrant/tree/master/keys/)
which vagrant will use by default when connecting.

```bash
sudo apt-get install openssh-server
wget https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
mkdir /home/vagrant/.ssh
chmod 644 vagrant.pub
mv vagrant.pub /home/vagrant/.ssh/authorized_keys
```

The line `AuthorizedKeysFile %h/.ssh/authorized_keys` was added to
`/etc/ssh/sshd_config` to allow passwordless SSH access to take effect after a
quick `/etc/init.d/ssh` restart.

## 8. Export box

With everything configured correctly, the next step was to turn off the VM and
export it.

```bash
vagrant package --base debiansqueeze squeeze32.box
```

The name debiansqueeze there is what I named the VM itself in VirtualBox.

## That's It

After that the box was ready to roll. Just gotta add it to Vagrant.

```bash
vagrant box add squeeze32 ~/squeeze32.box
```

From here on out it's plain old Vagrant usage. Hopefully all this effort will
pay off in the long run when I can sit back and push systems changes to
production with a beer in my hand.
