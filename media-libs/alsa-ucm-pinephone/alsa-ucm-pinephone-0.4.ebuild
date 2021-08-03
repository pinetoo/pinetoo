# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="298f1a12ce441d09e834935ccee6a1f92e0efe89"

DESCRIPTION="Alsa Use Casa Manager files for the PinePhone"
HOMEPAGE="https://github.com/dreemurrs-embedded/Pine64-Arch"
SRC_URI="https://github.com/dreemurrs-embedded/Pine64-Arch/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/Pine64-Arch-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="media-libs/alsa-ucm-conf"

src_install() {
	insinto /usr/share/alsa/ucm2/PinePhone
	doins PKGBUILDS/pine64/alsa-ucm-pinephone/*.conf
}
