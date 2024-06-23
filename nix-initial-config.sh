#!/bin/bash

# this script is built with the intended purpose of expediting manual installations
# of nixos virtual machines. Mind the drive names before executing.

parted /dev/vda -- mklabel gpt

parted /dev/vda -- mkpart root ext4 512MB 8GB

parted /dev/vda -- mkpart swap linux-swap 5GB 100%

parted /dev/vda -- mkpart ESP fat32 1MB 512MB

parted /dev/vda -- set 3 esp on

# format these new partitions

mkfs.ext4 -L nixos /dev/vda1

mkswap -L swap /dev/vda2

mkfs.fat -F 32 -n boot /dev/vda3

# mount file systems

mount /dev/vda /mnt

mkdir -p /mnt/boot

mount -o umask=077 /dev/vda3/boot /mnt/boot

# activate swap

swapon /dev/vda2

nixos-generate-config --root /mnt

nixconf="
{ config, pkgs, ... }: {
    imports = [
        ./hardware-configuration.nix
    ];
    boot.loader.systemd-boot.enable = true;
    services.sshd.enable = true
}"

echo $nixconf >> /mnt/etc/nixos/configuration.nix

cat /mnt/etc/nixos/configuration.nix
