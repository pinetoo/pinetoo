# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Python bindings for libgbinder"
HOMEPAGE="https://github.com/erfanoabdi/gbinder-python"
SRC_URI="https://github.com/erfanoabdi/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	dev-libs/libgbinder
	dev-libs/libglibutil"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-python/cython[${PYTHON_USEDEP}]
"

python_compile() {
	distutils-r1_python_compile --cython
}
