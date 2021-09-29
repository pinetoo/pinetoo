# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

ETYPE="headers"
H_SUPPORTEDARCH="arm64"

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="5.12-megi"
EGIT_COMMIT="ea7df6a5d8d2691335c651013b01d83201a76d1f"

KERNEL_TAG="5.12-20210715-1154"

inherit git-r3 kernel-2 toolchain-funcs
detect_version

#PATCH_PV=${PV} # to ease testing new versions against not existing patches
#PATCH_VER="1"
SRC_URI="https://github.com/megous/linux/archive/refs/tags/orange-pi-${KERNEL_TAG}.tar.gz"

KEYWORDS="~arm64"

DEPEND="app-arch/xz-utils
	dev-lang/perl"
RDEPEND=""

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
	#unpack ${A}
	default
	git-r3_src_unpack
}

src_prepare() {
	[[ -n ${PATCH_VER} ]] && eapply "${WORKDIR}"/${PATCH_PV}/*.patch

	default
}

src_install() {
	kernel-2_src_install

	# hrm, build system sucks
	find "${ED}" '(' -name '.install' -o -name '*.cmd' ')' -delete
	find "${ED}" -depth -type d -delete 2>/dev/null
}

src_test() {
	emake headers_check ${xmakeopts}
}
