# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="DBus-activated service that manages human feedback devices"
HOMEPAGE="https://gitlab.com/ubports/development/core/hfd-service"
SRC_URI="https://gitlab.com/ubports/development/core/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE="android qt5"

RDEPEND="
	dev-libs/deviceinfo
	sys-apps/accountsservice
	sys-apps/dbus
	virtual/libudev
	android? (
		dev-libs/libgbinder
		dev-libs/libglibutil
	)
	qt5? (
		dev-qt/qtfeedback:5
	)
"

DEPEND="${RDEPEND}"

BDEPEND="dev-util/cmake-extras"
