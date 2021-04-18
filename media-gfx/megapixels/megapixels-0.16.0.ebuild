# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A GTK3 camera application"
HOMEPAGE="https://git.sr.ht/~martijnbraam/megapixels"
SRC_URI="https://git.sr.ht/~martijnbraam/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+exif +jpeg"

DEPEND="
	dev-libs/glib
	media-gfx/zbar
	media-libs/tiff
	sys-kernel/linux-headers
	x11-libs/gtk+:3
"

RDEPEND="${DEPEND}
	media-gfx/dcraw
	exif? ( media-libs/exiftool )
	jpeg? ( media-gfx/imagemagick[jpeg,tiff] )
"
