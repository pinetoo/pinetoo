# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/lib/}"
MY_P="${MY_PN}-${PV}"

inherit qmake-utils

DESCRIPTION="Qt bindings for oFono"
HOMEPAGE="https://github.com/Kaffeine/libofono-qt"
SRC_URI="https://github.com/Kaffeine/${PN}/releases/download/${PV}/${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~arm64"
IUSE="doc"

BDEPEND="doc? ( app-doc/doxygen )"

PATCHES=( "${FILESDIR}/${PV}-target_path.patch" )

src_configure() {
	eqmake5 "${MY_PN}.pro"
}

src_install() {
	emake INSTALL_ROOT="${D}" install_subtargets
	use doc && emake INSTALL_ROOT="${D}" install_dox
}
