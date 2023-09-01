# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Library to detect and configure devices"
HOMEPAGE="https://gitlab.com/ubports/development/core/deviceinfo"
SRC_URI="https://gitlab.com/ubports/development/core/${PN}/-/archive/${PV}/${P}.tar.bz2"

KEYWORDS="~arm64"
LICENSE="GPL-3"
SLOT="0"
IUSE="systemd"

DEPEND="
	dev-cpp/yaml-cpp
	systemd? ( dev-libs/glib )
"
RDEPEND="${DEPEND}
	systemd? (
		sys-apps/dbus
		sys-apps/systemd
	)"

src_configure() {
	local mycmakeargs=(
		-DDISABLE_TESTS:BOOL=ON
		-DWITH_EXTRAS:BOOL=$(usex systemd ON OFF)
	)
	cmake_src_configure
}
