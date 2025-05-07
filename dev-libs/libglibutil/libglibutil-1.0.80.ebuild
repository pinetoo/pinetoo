# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Library of glib utilities"
HOMEPAGE="https://github.com/sailfishos/libglibutil"
SRC_URI="https://github.com/sailfishos/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="dev-libs/glib:2"
DEPEND="${RDEPEND}"

src_compile() {
	emake LIBDIR=/usr/$(get_libdir)
}

src_install() {
	emake LIBDIR=/usr/$(get_libdir) DESTDIR="${D}" install-dev
}
