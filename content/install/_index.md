+++
title = "Installation"
description = "How to install Pinetoo to get a Gentoo system on a PinePhone, PinePhone Pro"
weight = 2
+++
{{< lead >}}This document explains how to install Pinetoo on a PinePhone or PinePhone Pro to get a Gentoo system running on your phome.{{< /lead >}}

The process is very similar for both models. When there is any difference, it will be noted.

This process may brick your phone and it may be hard to recover depending on your model on how it was bricked.

This is aimed only at experienced Gentoo Linux users which are familiar with PinePhones.

Proceed at your own risk.

## Installation destination

The first thing you will have to decide is whether you want to install Pinetoo in the eMMC card (usually `/dev/mmcblk2`) or the SD card (usually `/dev/mmcblk0`).

Installing it in the SD card allows easily trying different OS's by just swapping the SD card so it's a good option for a first try. On the other hand, the eMMC is faster so it's a good option if you want to make it your main choice, but it's harder to replace later.

There is another important difference to consider between the PinePhone and the PinePhone Pro when making this choice:

* The original PinePhone boots from SD card first if present. That makes it easy to failback to other OS if your main one is broken. For example, if the OS you have in the eMMC is broken, you just need to insert an SD card with a valid OS to boot from. On the other hand, if the OS you have in the SD card is broken, you can just remove the SD card to boot from the eMMC or insert a differnt SD card with a valid OS.
* The PinePhone Pro, however, will always boot from the eMMC card first. That means that if the OS in your eMMC card is broken, you will find it [harder to boot form the SD card](https://wiki.pine64.org/wiki/PinePhone_Pro#Boot_from_microSD_card_temporarily). If you use [Tow-Boot](https://tow-boot.org/devices/pine64-pinephoneA64.html) as the bootloader for your PinePhone Pro, you will have the option to easily choose where you want to boot from using the volume buttons, unless what you broke is the Tow-Boot bootloader itself, of course.

In other words, you have to be sure before installing to the eMMC in the PinePhone Pro and Tow-Boot is the recommended bootloader for the PinePhone Pro as it offers a failback option when the OS in the eMMC is not booting.

## Building packages

It's strongly discouraged that you compile the packages directly on the phone.

This will cause a heavy load on the phone it's not ready for and will cause it to heat and possibly cause physical damages.

Instead, the recommendation is to use another ARM64 device where you can compile the packages and that you can later install in your phone using `emerge --usepkg` or `emerge --getbinpkg`.

Pre-compiled packages are already offered at the following URLs:

* https://binpkgs.chuso.net/arm64/pinetoo-systemd-mergedusr/ for a systemd profile with merged `/usr`. _Not_ suitable for a profile with a split `/usr`.
* https://binpkgs.chuso.net/arm64/pinetoo-systemd-splitusr/ for a systemd profile with a split `/usr`. Also suitable for profiles with a merged `/usr`.

Check Gentoo documentation on [binary packages](https://wiki.gentoo.org/wiki/Binary_package_guide) if you need more details on how this works.

## Installation environment

As this guide is intended for experienced Gentoo users, we must assume you know how to setup your installation environment, but some generic guidelines are provided. Check [Gentoo documentation](https://wiki.gentoo.org/wiki/Handbook:Main_Page) for more details.

* If you plan to install to eMMC, you will have to boot your phone with a different OS from the SD card.
* If you plan to install to the SD card, you can plug your SD card to any ARM64 device and prepare it separately and later plug it your phone or you can alredy plug the SD card to your phone and boot it from eMMC to prepare the SD card directly from your phone.

For the OS you will use to boot your phone and jump into the installation environment, you can check the software releases page for your device in Pine64 Wiki:

* [PinePhone](https://wiki.pine64.org/wiki/PinePhone_Pro_Software_Releases)
* [PinePhone Pro](https://wiki.pine64.org/wiki/PinePhone_Pro_Software_Releases)

### Basic steps

As already mentioned, familiarity with the Gentoo Linux installation process is assumed, so we are not going to go very deep into these details and we are going to mention only the points that require additional clarifications from the usual Gentoo installation process.

#### Partition the storage

You can follow your personal preference here, like either splitting `/home` and `/var` to separate partitions or having only one single partition for all your storage, depending also on how big is your storage.

Just note that not all bootloaders will support all options (like LVM and encryption, for example) and different bootloaders have different requirements for their boot partition.

You will need one boot partition usually at the beginning of your disk, not too big but big enough to store all the kernels you want to have available.

### Installing the Pinetoo repository

After you have unpacked the stage tarball, chroot'ed into the installation target and cloned the Portage tree but before you start install the system packages with `emerge`, it's advised that you also install and enable the Pinetoo ebuild repository.

This is because this repository replaces some `::gentoo` packages and sets some Portage options you will probably want to have present when you start building your system.

If you already have `dev-vcs/git` and `app-admin/eselect-repository` installed, you can add the Pinetoo repository just by running:

```bash
eselect repository add pinetoo git https://github.com/pinetoo/pinetoo.git
```

If you don't have `dev-vcs/git` and `app-admin/eselect-repository` installed yet, you can install them with `emerge --ask dev-vcs/git app-admin/eselect-repository` and then run the command above or you can just download the latest tarball release from the [Releases](https://github.com/pinetoo/pinetoo/releases) page, unpack it and create the corresponding file under `/etc/portage/repos.conf`.

Make sure the Pinetoo repository is listed with a higher priority than the Gentoo one with `emerge --info`:

```
# emerge --info
Portage 3.0.49
=================================================================
[...]
Repositories:

gentoo
    location: /var/db/repos/gentoo
    sync-type: git
    sync-uri: git://anongit.gentoo.org/repo/gentoo.git
    priority: 99
    volatile: False

pinetoo
    location: /var/db/repos/pinetoo
    sync-type: git
    sync-uri: https://github.com/pinetoo/pinetoo
    masters: gentoo
    priority: 100
    volatile: True
```

Then list the available profiles with `eselect profile list` and choose one with `eselect profile set`:

```
# eselect profile list
Available profile symlink targets:
  [1]   default/linux/arm64/17.0 (stable)
  [2]   default/linux/arm64/17.0/hardened (exp)
  [3]   default/linux/arm64/17.0/hardened/selinux (dev)
  [4]   default/linux/arm64/17.0/desktop (stable)
  [5]   default/linux/arm64/17.0/desktop/gnome (stable)
  [6]   default/linux/arm64/17.0/desktop/gnome/systemd (stable)
  [7]   default/linux/arm64/17.0/desktop/gnome/systemd/merged-usr (stable)
  [8]   default/linux/arm64/17.0/desktop/plasma (stable)
  [9]   default/linux/arm64/17.0/desktop/plasma/systemd (stable)
  [10]  default/linux/arm64/17.0/desktop/plasma/systemd/merged-usr (stable)
  [11]  default/linux/arm64/17.0/desktop/systemd (stable)
  [12]  default/linux/arm64/17.0/desktop/systemd/merged-usr (stable)
  [13]  default/linux/arm64/17.0/developer (exp)
  [14]  default/linux/arm64/17.0/systemd (stable)
  [15]  default/linux/arm64/17.0/systemd/merged-usr (stable)
  [16]  default/linux/arm64/17.0/systemd/selinux (exp)
  [17]  default/linux/arm64/17.0/systemd/selinux/merged-usr (exp)
  [18]  default/linux/arm64/17.0/llvm (exp)
  [19]  default/linux/arm64/17.0/systemd/llvm (exp)
  [20]  default/linux/arm64/17.0/systemd/llvm/merged-usr (exp)
  [21]  default/linux/arm64/17.0/big-endian (exp)
  [22]  default/linux/arm64/17.0/big-endian/systemd (exp)
  [23]  default/linux/arm64/17.0/big-endian/systemd/merged-usr (exp)
  [24]  default/linux/arm64/17.0/musl (dev)
  [25]  default/linux/arm64/17.0/musl/llvm (exp)
  [26]  default/linux/arm64/17.0/musl/hardened (exp)
  [27]  default/linux/arm64/17.0/musl/hardened/selinux (exp)
  [28]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephone/plasma/systemd/merged-usr (dev)
  [29]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephone/plasma/systemd (dev) *
  [30]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephone/plasma (exp)
  [31]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephone (exp)
  [32]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephonepro/plasma/systemd/merged-usr (dev)
  [33]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephonepro/plasma/systemd (dev)
  [34]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephonepro/plasma (exp)
  [35]  pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephonepro (exp)
  [36]  pinetoo:pinetoo/linux/arm64/17.0/mobile/plasma/systemd/merged-usr (exp)
  [37]  pinetoo:pinetoo/linux/arm64/17.0/mobile/plasma/systemd (exp)
  [38]  pinetoo:pinetoo/linux/arm64/17.0/mobile/plasma (exp)
  [39]  pinetoo:pinetoo/linux/arm64/17.0/mobile (exp)
# eselect profile set 29
```

A profile prefixed with `pinetoo:` and _not_ marked as `exp` is recommended.

For example, from the list above:

* `pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephone/plasma/systemd/merged-usr`

  For a PinePhone with Plasma Mobile and systemd with merged `/usr`.

* `pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephone/plasma/systemd`

  For a PinePhone with Plasma Mobile and systemd with split `/usr`.

* `pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephonepro/plasma/systemd/merged-usr`

  For a PinePhone Pro with Plasma Mobile and systemd with merged `/usr`.

* `pinetoo:pinetoo/linux/arm64/17.0/mobile/pinephonepro/plasma/systemd`

  For a PinePhone Pro with Plasma Mobile and systemd with split `/usr`.

For merged or split `/usr`, please choose the profile for the Gentoo stage tarball you have downloaded.

The rest of the profiles marked as `exp` haven't been tested.
