# Gentoo NFS chroot

This small project provides a docker image for chrooting to remote Gentoo installation

## Why?

The reason is simple, I like a lot Gentoo, but one computer I own, is an old Atom 330 and updates takes a loooooong time. Investigating a little bit I found a [post](https://forums.gentoo.org/viewtopic-p-6817608.html) on Gentoo forums, and I decided to package it on a docker image, this will allow me to use on any system with docker.

## Requirements

- Gentoo installation exporting root via nfs
- Docker
- Remote and host cpu's with compatible instruction set

## Configure nfs exports

Install nfs-utils and start nfs server:

```sh
emerge nfs-utils
/etc/init.d/nfs start
```

Edit `/etc/exports` and the adding the following line:

```
/ 192.168.0.0/24(rw,insecure,no_root_squash,sync,no_subtree_check,crossmnt)
```
**NOTE** Replace `192.168.0.0` with your network.

Re-export your nfs shares

```
exportfs -r
```

## Run docker image

Execute:

```sh
docker run --rm -it --cap-add sys_admin --cap-add net_admin ribugent/gentoo-nfs-chroot <remote ip>
```
