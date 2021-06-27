# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson systemd

DESCRIPTION="Manager daemon for the Quectel EG25 mobile broadband modem"
HOMEPAGE="https://gitlab.com/mobian1/devices/eg25-manager"
SRC_URI="https://gitlab.com/mobian1/devices/${PN}/-/archive/${PV}/${P}.tar.bz2"
#S="${WORKDIR}/${P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="modemmanager ofono"
#RESTRICT="strip"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libgudev
	dev-libs/libgpiod
	virtual/libusb:1
	modemmanager? ( net-misc/modemmanager[introspection] )
	ofono? ( net-misc/ofono )"

DEPEND="${RDEPEND}"

BDEPEND="dev-util/meson"

src_install() {
	meson_src_install

	systemd_dounit "${FILESDIR}/${PN}.service"
}

pkg_postinst() {
	systemd_enable_service multi-user.target "${PN}.service"
}
