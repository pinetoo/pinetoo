# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

EGIT_REPO_URI="https://github.com/LibreELEC/brcmfmac_sdio-firmware.git"
EGIT_COMMIT="88e46425ef489513c0b8bf7c2747d262367be1cc"

DESCRIPTION="Broadcom SDIO firmware"
HOMEPAGE="https://github.com/LibreELEC/brcmfmac_sdio-firmware"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~arm64"
IUSE=doc

src_prepare() {
	default
	# Already provided by sys-kernel/linux-firmware
	rm brcmfmac4335-sdio.bin \
		brcmfmac43430a0-sdio.bin \
		brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt \
		brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt \
		brcmfmac4334-sdio.bin \
		brcmfmac4329-sdio.bin \
		brcmfmac4330-sdio.bin \
		brcmfmac4356-sdio.khadas,vim2.txt || die
}

src_install() {
	use doc && dodoc README.md
	rm README.md
	insinto /lib/firmware/brcm
	doins *
}
