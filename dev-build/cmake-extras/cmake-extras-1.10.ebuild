# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A collection of add-ons for the CMake build tool"
HOMEPAGE="https://gitlab.com/ubports/development/core/cmake-extras"
SRC_URI="https://gitlab.com/ubports/development/core/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE="examples"

src_prepare() {
	default
	sed -i "s%/usr/lib/%/usr/$(get_libdir)/%" src/QmlPlugins/QmlPluginsConfig.cmake || die
	cmake_src_prepare
}

src_install() {
	cmake_src_install

	if use examples; then
		dodoc -r examples
	fi
}
