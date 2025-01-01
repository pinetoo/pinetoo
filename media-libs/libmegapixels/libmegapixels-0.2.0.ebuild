# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A GTK3 camera application"
HOMEPAGE="https://gitlab.com/megapixels-org/libmegapixels"
SRC_URI="https://gitlab.com/megapixels-org/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"

BDEPEND="virtual/pkgconfig
	dev-build/cmake"

DEPEND="dev-libs/libconfig"

RDEPEND="${DEPEND}"
