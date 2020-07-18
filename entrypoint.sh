#!/bin/bash

set -e

HOST=$1
ROOT=/mnt/gentoo

mkdir -p --mode=0755 "${ROOT}"
mkdir -p --mode=0755 /var/tmp/portage

mount -t nfs -o rw,noatime,nocto,actimeo=60,lookupcache=positive,vers=4,fsc "${HOST}:/" "${ROOT}"
mount --bind {,"${ROOT}"}/dev
mount --bind {,"${ROOT}"}/dev/pts
mount --bind {,"${ROOT}"}/dev/shm
mount --bind {,"${ROOT}"}/proc
mount --bind {,"${ROOT}"}/sys
mount --bind {,"${ROOT}"}/var/tmp/portage

exec chroot "${ROOT}" /bin/bash -l
