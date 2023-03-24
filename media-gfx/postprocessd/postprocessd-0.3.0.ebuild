# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A native postprocessing pipeline for media-gfx/megapixels"
HOMEPAGE="https://git.sr.ht/~martijnbraam/postprocessd"
SRC_URI="https://git.sr.ht/~martijnbraam/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE="man"

BDEPEND="app-text/scdoc"

DEPEND="
	media-libs/libexif
	media-libs/libjpeg-turbo
	media-libs/libraw
	media-libs/opencv
	media-libs/tiff
	man? ( app-text/scdoc )
"

RDEPEND="${DEPEND}"
