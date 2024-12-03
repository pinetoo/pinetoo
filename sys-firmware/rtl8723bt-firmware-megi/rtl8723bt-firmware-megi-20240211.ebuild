# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

EGIT_REPO_URI="https://megous.com/git/linux-firmware"
EGIT_COMMIT="5f29ab9f2492c66614619f4fd798863d15192116"

DESCRIPTION="Firmware files for RTL8723BS/CS in PinePhone"
HOMEPAGE="https://xff.cz/git/linux-firmware/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~arm64"

src_install() {
	insinto /lib/firmware
	doins -r rtl_bt
}
