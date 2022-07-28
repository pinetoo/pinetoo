# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Call audio routing daemon"
HOMEPAGE="https://gitlab.com/mobian1/callaudiod"
SRC_URI="https://gitlab.com/mobian1/${PN}/-/archive/${PV}/${P}.tar.bz2"

KEYWORDS="~arm64"
LICENSE="GPL-3"
SLOT="0"

BDEPEND="dev-util/gdbus-codegen
	dev-util/glib-utils"

RDEPEND="
	dev-libs/glib:2
	media-libs/alsa-lib
	|| (
		media-libs/libpulse
		>=media-sound/apulse-0.1.12-r4[sdk]
	)
"
