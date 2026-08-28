# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Meta package for packages required to support the PinePhone Pro"
HOMEPAGE="https://pine64.org/devices/pinephone_pro/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="geolocation kde"

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
	sys-kernel/pinephonepro-kernel
	geolocation? ( sci-geosciences/gpsd )
	kde? (
		|| (
			>=kde-plasma/kwin-${PV}:${SLOT}[gles2-only]
			>=media-libs/mesa-26.2.0
		)
	)
"
