# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils meson optfeature

DESCRIPTION="A GTK3 camera application"
HOMEPAGE="https://gitlab.com/megapixels-org/Megapixels"
SRC_URI="https://gitlab.com/megapixels-org/Megapixels/-/archive/${PV}/${P/me/Me}.tar.bz2"
S="${WORKDIR}/${P/me/Me}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+exif +jpeg"

DEPEND="
	dev-libs/feedbackd
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
	optfeature "native image postprocessing" media-gfx/postprocessd
}
