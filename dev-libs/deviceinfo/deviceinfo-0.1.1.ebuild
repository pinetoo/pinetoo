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

DEPEND="
	dev-cpp/yaml-cpp
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DDISABLE_TESTS:BOOL=ON
	)
	cmake_src_configure
}
