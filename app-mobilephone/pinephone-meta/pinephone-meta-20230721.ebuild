# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_MIN=21.08

DESCRIPTION="Meta package for packages required to support the PinePhone"
HOMEPAGE="https://manjaro.org/laptops/pine64/pinephone/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="geolocation"

RDEPEND="
	app-misc/pinephone-manjaro-tweaks
	app-mobilephone/pinephone-modem-scripts
	dev-libs/feedbackd
	kde-plasma/plasma-mobile-settings
	media-libs/alsa-ucm-pinephone
	net-misc/modemmanager[qmi]
	sys-apps/zswap
	|| ( sys-boot/p-boot-bin sys-boot/p-boot-bin )
	sys-boot/pinetoo-bootsplash
	sys-firmware/pinephone-firmware
	sys-kernel/pinephone-kernel
	geolocation? ( sci-geosciences/gpsd )
"
