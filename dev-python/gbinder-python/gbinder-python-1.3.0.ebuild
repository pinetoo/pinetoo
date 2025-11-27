# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..14} )

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
inherit distutils-r1

DESCRIPTION="Python bindings for libgbinder"
HOMEPAGE="https://github.com/waydroid/gbinder-python"
SRC_URI="https://github.com/waydroid/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	dev-libs/libgbinder
	dev-libs/libglibutil"
RDEPEND="${DEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	"
BDEPEND="
	virtual/pkgconfig
"
