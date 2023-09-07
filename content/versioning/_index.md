+++
title = "Versioning"
description = "Explaining Pinetoo versioning model"
weight = 1
+++
This repository tries to keep KDE version in sync with `::gentoo` stable version. This means that if KDE Plasma 5.27.6 and KDE Gear 23.04.2 are the latest stable versions in `::gentoo` and KDE Plasma 5.27.7 and KDE Gear 23.04.3 are unstable in `::gentoo`, this repository will package the version of its packages that correspond to Plasma 5.27.6 and Gear 23.04.2. This will keep the whole experience as much stable as possible and because unstable versions in `::gentoo` usually pull many other unstable dependencies that would make the whole environment less reliable and much harder to maintain.

This also means that there will be a small delay between a new KDE version being marked as stable in `::gentoo` and the corresponding packages being available in `::pentoo`.

Unlike other Gentoo repositories which usually follow the rolling release cycle, this one uses a versioned release due to do the inter-dependencies between many packages. For example, some KDE applications require specific KDE libraries and mixing differnt versions in Maui applications and libraries usually doesn't work.

Thus, each Pinetoo release has a 10-part version number split the following way:

* The first three parts are the KDE Plasma version.
* The next three items are the KDE Gear version.
* The next three ones are the MauiKit version.
* The last part is the Pinetoo release, which is an additional version number of changes introduced between Pinetoo releases when the KDE Plasma, KDE Gear and MauiKit versions are the same.

For example, version number `5.27.7.23.04.3.3.0.1.1` would be read as:

* KDE Plasma version 5.27.7.
* KDE Gear version 23.04.3.
* MauiKit version 3.0.1.
* Pinetoo release 1.

The changes between versions are documented in a [change log](https://github.com/pinetoo/pinetoo/blob/master/CHANGELOG.md) file in the repository and also in GitHub's [releases](https://github.com/pinetoo/pinetoo/releases) page.

However, you don't need to care about any of this as long as you keep your repository in the `master` branch (which is the default unless you have manually changed it).  
New versions are developed in a [separate branch](https://github.com/pinetoo/pinetoo/branches) and merged to `master` only after they have been finished and tested. So you will already receive new versions as soon as they are ready.
