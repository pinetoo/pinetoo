# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils meson

DESCRIPTION="A GTK3 camera application"
HOMEPAGE="https://gitlab.com/postmarketOS/megapixels"
SRC_URI="https://gitlab.com/postmarketOS/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+exif +jpeg"

DEPEND="
	dev-libs/glib
	>=gui-libs/gtk-4.7.1:4
	media-gfx/zbar
	media-libs/tiff
	sys-kernel/linux-headers
"

RDEPEND="${DEPEND}
	media-gfx/dcraw
	exif? ( media-libs/exiftool )
	jpeg? ( media-gfx/imagemagick[jpeg,tiff] )
"

src_prepare() {
	sed -i \
		"s_<default>''</default>_<default>'/usr/share/megapixels/postprocess.sh'</default>_" \
		data/org.postmarketos.Megapixels.gschema.xml || die
	default
}

pkg_postinst() {
	gnome2_schemas_update
}
