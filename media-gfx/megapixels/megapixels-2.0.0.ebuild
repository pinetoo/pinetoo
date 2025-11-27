# Copyright 1999-2025 Gentoo Authors
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
IUSE="+exif +jpeg wayland X"
# REQUIRED_USE="|| ( wayland X )"

DEPEND="
	dev-libs/feedbackd
	dev-libs/glib
	media-gfx/zbar
	>=media-libs/libdng-0.2.2
	media-libs/libepoxy
	>=media-libs/libmegapixels-0.2.1
	sys-kernel/linux-headers
	wayland? (
		dev-libs/wayland
		>=gui-libs/gtk-4.7.1:4[wayland]
	)
	X? (
		>=gui-libs/gtk-4.7.1:4[X]
		x11-libs/libX11
		x11-libs/libXrandr
	)
"

RDEPEND="${DEPEND}
	media-gfx/dcraw
	exif? ( media-libs/exiftool )
	jpeg? ( media-gfx/imagemagick[jpeg,tiff] )
"

src_prepare() {
	sed -i \
		"s_<default>''</default>_<default>'/usr/share/megapixels/postprocess.sh'</default>_" \
		data/me.gapixels.Megapixels.gschema.xml || die
	default
}

pkg_postinst() {
	gnome2_schemas_update
	optfeature "native image postprocessing" media-gfx/postprocessd
}
