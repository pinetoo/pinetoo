# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="${PV/_*/}"
MY_P="${PN}-${MY_PV}"

inherit gnome2-utils meson

DESCRIPTION="A GTK3 camera application"
HOMEPAGE="https://gitlab.com/postmarketOS/megapixels"
SRC_URI="https://gitlab.com/postmarketOS/${PN}/-/archive/${MY_PV}/${MY_P}.tar.bz2"

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

PATCHES=(
	"${FILESDIR}/${MY_PV}-non_zero_pad_indices.patch"
	"${FILESDIR}/${MY_PV}-config_media_formats.patch"
	"${FILESDIR}/${MY_PV}-pinephonepro_20221201.patch"
	"${FILESDIR}/${MY_PV}-increase_burst_minimum.patch"
	"${FILESDIR}/${MY_PV}-increase_capture_rate.patch"
)

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -i \
		"s_<default>''</default>_<default>'/usr/share/megapixels/postprocess.sh'</default>_" \
		data/org.postmarketos.Megapixels.gschema.xml || die
	default
}

pkg_postinst() {
	gnome2_schemas_update
}
