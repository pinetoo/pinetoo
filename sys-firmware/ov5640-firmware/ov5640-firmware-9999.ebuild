# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

EGIT_REPO_URI="https://github.com/pmsourcedump/ov5640.git"

DESCRIPTION="Firmware for the OV5640 sensor in the PinePhone"
HOMEPAGE="https://github.com/pmsourcedump/ov5640"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~arm64"

src_install() {
	insinto /lib/firmware
	doins ov5640_af.bin
}
