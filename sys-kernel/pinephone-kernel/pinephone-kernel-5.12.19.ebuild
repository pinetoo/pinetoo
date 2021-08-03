# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="5.12-megi"
EGIT_COMMIT="ea7df6a5d8d2691335c651013b01d83201a76d1f"

KERNEL_TAG="5.12-20210715-1154"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://megous.com/git/linux"
SRC_URI="https://github.com/megous/linux/archive/refs/tags/orange-pi-${KERNEL_TAG}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

PATCHES=(
	"${WORKDIR}/${P}/5.12.17-18.patch"
	"${WORKDIR}/${P}/5.12.18-19.patch"
	"${WORKDIR}/${P}/enable-hdmi-output-pinetab.patch"
	"${WORKDIR}/${P}/enable-jack-detection-pinetab.patch"
	"${WORKDIR}/${P}/pinetab-bluetooth.patch"
	"${WORKDIR}/${P}/pinetab-accelerometer.patch"
	"${WORKDIR}/${P}/dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/media-ov5640-Implement-autofocus.patch"
	"${WORKDIR}/${P}/0011-dts-pinetab-hardcode-mmc-numbers.patch"
	"${WORKDIR}/${P}/0012-pinephone-fix-pogopin-i2c.patch"
	"${WORKDIR}/${P}/0107-quirk-kernel-org-bug-210681-firmware_rome_error.patch"
	"${WORKDIR}/${P}/0177-leds-gpio-make-max_brightness-configurable.patch"
	"${WORKDIR}/${P}/0179-arm64-dts-allwinner-pinephone-improve-device-tree.patch"
	"${WORKDIR}/${P}/panic-led.patch"
	"${WORKDIR}/${P}/0001-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch"
	"${WORKDIR}/${P}/0002-revert-fbcon-remove-no-op-fbcon_set_origin.patch"
	"${WORKDIR}/${P}/0003-revert-fbcon-remove-soft-scrollback-code.patch"
	"${WORKDIR}/${P}/0001-bootsplash.patch"
	"${WORKDIR}/${P}/0002-bootsplash.patch"
	"${WORKDIR}/${P}/0003-bootsplash.patch"
	"${WORKDIR}/${P}/0004-bootsplash.patch"
	"${WORKDIR}/${P}/0005-bootsplash.patch"
	"${WORKDIR}/${P}/0006-bootsplash.patch"
	"${WORKDIR}/${P}/0007-bootsplash.patch"
	"${WORKDIR}/${P}/0008-bootsplash.patch"
	"${WORKDIR}/${P}/0009-bootsplash.patch"
	"${WORKDIR}/${P}/0010-bootsplash.patch"
	"${WORKDIR}/${P}/0011-bootsplash.patch"
	"${WORKDIR}/${P}/0012-bootsplash.patch"
)

S="${WORKDIR}/linux-orange-pi-${KERNEL_TAG}"

src_unpack() {
	default
	git-r3_src_unpack
}

src_configure() {
	cp "${WORKDIR}/${P}/config" .config || die
	kernel-build_src_configure
}
