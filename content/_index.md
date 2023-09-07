+++
title = "Pinetoo"
description = "Gentoo Portage overlay for the PinePhone"
weight = 1
+++

{{< lead >}}Pinetoo is a Gentoo ebuilds repository for PinePhone devices.{{< /lead >}}

In addition to the PinePhone and the PinePhone Pro, the RockPro64 device also from Pine64 is also supported as it requires very few additional work.

The graphical environment it packages is Plasma Mobile with ModemManager for the telephony part.  
It previously packaged oFono, but that was removed when Plasma Mobile switched to ModemManager.  
Not like I am against packaging other alternatives like Phosh for the GUI with oFono, but this currently a one-man effort, I am focusing my work on the parts I am interested in.  
Contributions are welcome though.

## Download

If you only want to download and use the ebuilds repository, you can just follow the usual way for Gentoo ebuild repositories:

```bash
eselect repository add pinetoo git https://github.com/pinetoo/pinetoo.git
```

Or you can just manually clone the repository:

```bash
git clone https://github.com/pinetoo/pinetoo.git
```

For setting up a PinePhone or PinePhone Pro running Gentoo with this repository, you can follow the separate instructions:

### [Installing Pinetoo in a PinePhone]({{< relref "install" >}}))
