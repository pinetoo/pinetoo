# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Animated boot spash for the PinePhone"
HOMEPAGE="https://pinetoo.org"
SRC_URI="https://gitlab.manjaro.org/manjaro-arm/packages/extra/bootsplash-theme-kde/-/raw/32a59a002dcfd38a0fdb382b4cba1dd8d3d7f3c9/KDE.gif -> ${P}.gif"

S="${WORKDIR}"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"

BDEPEND="
	media-gfx/bootsplash-packer
	media-gfx/imagemagick"

src_unpack() {
	convert -alpha remove -background "#000000" "${DISTDIR}"/${A} logo%02d.rgb || die
}

src_compile() {
	LOGO_WIDTH=$(identify "${DISTDIR}"/${A} | cut -d " " -f 3 | cut -d x -f 1) || die
	LOGO_HEIGHT=$(identify "${DISTDIR}"/${A} | cut -d " " -f 3 | cut -d x -f 2) || die
	bootsplash-packer --bg_red 0x00 --bg_green 0x00 --bg_blue 0x00 --frame_ms 48 --picture --pic_width "${LOGO_WIDTH}" --pic_height "${LOGO_HEIGHT}" --pic_position 0 --pic_anim_type 1 --pic_anim_loop 0 --blob logo00.rgb --blob logo01.rgb --blob logo02.rgb --blob logo03.rgb --blob logo04.rgb --blob logo05.rgb --blob logo06.rgb --blob logo07.rgb bootsplash || die
}

src_install() {
	insinto /lib/firmware/bootsplash-themes/pinetoo
	doins bootsplash
	insinto /usr/lib/initcpio/install
	doins "${FILESDIR}/${PN}"
}
