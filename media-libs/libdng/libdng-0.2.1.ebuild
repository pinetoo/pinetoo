# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Interface library between libtiff and the world to validate DNG output"
HOMEPAGE="https://gitlab.com/megapixels-org/libdng"
SRC_URI="https://gitlab.com/megapixels-org/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"
IUSE="man"

BDEPEND="virtual/pkgconfig"

DEPEND="media-libs/tiff"

RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature man man-pages)
	)
	meson_src_configure
}
