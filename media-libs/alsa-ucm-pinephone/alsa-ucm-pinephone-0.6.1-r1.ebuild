# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="ac6eeb7d39170db8607405870b69c00526202dff"

DESCRIPTION="Alsa Use Casa Manager files for the PinePhone"
HOMEPAGE="https://github.com/dreemurrs-embedded/Pine64-Arch"
SRC_URI="https://github.com/dreemurrs-embedded/Pine64-Arch/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/Pine64-Arch-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="
	media-libs/alsa-ucm-conf
	>sys-kernel/pinephone-kernel-5.14.0
"

src_install() {
	insinto /usr/share/alsa/ucm2/Pine64/PinePhone
	doins PKGBUILDS/pine64/alsa-ucm-pinephone/{HiFi,VoiceCall}.conf
	insinto /usr/share/alsa/ucm2/conf.d/simple-card
	doins PKGBUILDS/pine64/alsa-ucm-pinephone/PinePhone.conf
}
