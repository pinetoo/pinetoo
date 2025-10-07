# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_MIN=21.08

DESCRIPTION="Meta package for packages required to support the PinePhone Pro"
HOMEPAGE="https://manjaro.org/laptops/pine64/pinephone/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="geolocation +policykit"

RDEPEND="
	app-misc/pinephonepro-manjaro-tweaks
	app-mobilephone/pinephone-modem-scripts
	dev-libs/feedbackd
	kde-plasma/plasma-mobile-settings
	media-libs/alsa-ucm-pinephone
	net-misc/modemmanager[qmi]
	sys-apps/zswap
	sys-boot/u-boot
	sys-boot/pinetoo-bootsplash
	|| (
		sys-kernel/pinephonepro-kernel
		sys-kernel/pinephonepro-manjaro-kernel
	)
	geolocation? ( sci-geosciences/gpsd )
"
