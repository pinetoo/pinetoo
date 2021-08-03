# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Metapackage for all firmware required by the PhinePhone"
HOMEPAGE="https://pinetoo.org"
LICENSE="metapackage"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="
	sys-firmware/anx7688-firmware
	sys-firmware/ov5640-firmware
	sys-firmware/rtl8723bt-firmware-megi"
