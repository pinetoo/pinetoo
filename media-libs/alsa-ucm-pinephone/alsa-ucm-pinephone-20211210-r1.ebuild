# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.com/pine64-org/pine64-alsa-ucm.git"
EGIT_COMMIT="ec0ef36b8b897ed1ae6bb0d0de13d5776f5d3659"

inherit git-r3

DESCRIPTION="Alsa Use Casa Manager files for the PinePhone"
HOMEPAGE="https://gitlab.com/pine64-org/pine64-alsa-ucm"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="
	media-libs/alsa-ucm-conf
	|| ( >sys-kernel/pinephone-kernel-5.14.0 >sys-kernel/pinephonepro-kernel-5.14.0 )
"

src_prepare() {
	default
	sed -i 's-	File "-&/Pine64/PinePhone/-' ucm2/PinePhone/PinePhone.conf || die
	sed -i 's-	File "-&/Pine64/PinePhonePro/-' ucm2/PinePhonePro/PinePhonePro.conf || die
}

src_install() {
	insinto /usr/share/alsa/ucm2/conf.d/simple-card
	doins ucm2/PinePhone*/PinePhone*.conf
	insinto /usr/share/alsa/ucm2/Pine64/PinePhone
	doins ucm2/PinePhone/{HiFi,VoiceCall}.conf
	insinto /usr/share/alsa/ucm2/Pine64/PinePhonePro
	doins ucm2/PinePhonePro/{HiFi,VoiceCall}.conf
}
