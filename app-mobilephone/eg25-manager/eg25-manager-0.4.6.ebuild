# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson systemd

DESCRIPTION="Manager daemon for the Quectel EG25 mobile broadband modem"
HOMEPAGE="https://gitlab.com/mobian1/devices/eg25-manager"
SRC_URI="https://gitlab.com/mobian1/devices/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="modemmanager ofono"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libgudev
	dev-libs/libgpiod
	virtual/libusb:1
	modemmanager? ( net-misc/modemmanager[introspection] )
	ofono? ( net-misc/ofono )"

DEPEND="${RDEPEND}"

pkg_postinst() {
	systemd_enable_service multi-user.target "${PN}.service"
}
