# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

EGIT_REPO_URI="https://xff.cz/git/linux-firmware/"
EGIT_COMMIT="0228ba810113bf0e8457b6f5d87bee43adc17be1"

DESCRIPTION="Firmware files for RTL8723BS/CS in PinePhone"
HOMEPAGE="https://xff.cz/git/linux-firmware/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~arm64"

src_install() {
	insinto /lib/firmware
	doins -r rtl_bt
}
