# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

ETYPE="headers"
H_SUPPORTEDARCH="arm64"

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="5.19-megi"
EGIT_COMMIT="d99088247157d023e57bc711477bae0387dd58df"

KERNEL_TAG="5.19-20220825-0031"

inherit git-r3 kernel-2
detect_version

SRC_URI="https://github.com/megous/linux/archive/refs/tags/orange-pi-${KERNEL_TAG}.tar.gz"

KEYWORDS="~arm64"

DEPEND="app-arch/xz-utils
	dev-lang/perl"
RDEPEND=""

PATCHES=(
	"${WORKDIR}/${P}/5.19.3-4.patch"
	"${WORKDIR}/${P}/0101-arm64-dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/0102-arm64-dts-pinephone-pro-remove-modem-node.patch"
	"${WORKDIR}/${P}/0103-ccu-sun50i-a64-reparent-clocks-to-lower-speed-oscillator.patch"
	"${WORKDIR}/${P}/0104-quirk-kernel-org-bug-210681-firmware_rome_error.patch"
	"${WORKDIR}/${P}/0105-leds-gpio-make-max_brightness-configurable.patch"
	"${WORKDIR}/${P}/0106-panic-led.patch"
	"${WORKDIR}/${P}/0201-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch"
	"${WORKDIR}/${P}/0202-revert-fbcon-remove-no-op-fbcon_set_origin.patch"
	"${WORKDIR}/${P}/0203-revert-fbcon-remove-soft-scrollback-code.patch"
	"${WORKDIR}/${P}/0301-bootsplash.patch"
	"${WORKDIR}/${P}/0302-bootsplash.patch"
	"${WORKDIR}/${P}/0303-bootsplash.patch"
	"${WORKDIR}/${P}/0304-bootsplash.patch"
	"${WORKDIR}/${P}/0305-bootsplash.patch"
	"${WORKDIR}/${P}/0306-bootsplash.patch"
	"${WORKDIR}/${P}/0307-bootsplash.patch"
	"${WORKDIR}/${P}/0308-bootsplash.patch"
	"${WORKDIR}/${P}/0309-bootsplash.patch"
	"${WORKDIR}/${P}/0310-bootsplash.patch"
	"${WORKDIR}/${P}/0311-bootsplash.patch"
	"${WORKDIR}/${P}/0312-bootsplash.patch"
)

S="${WORKDIR}/linux-orange-pi-${KERNEL_TAG}"

# bug #816762
RESTRICT="test"

src_unpack() {
	default
	git-r3_src_unpack
}

src_prepare() {
	default
}

src_test() {
	emake headers_check ${xmakeopts}
}

src_install() {
	kernel-2_src_install

	find "${ED}" \( -name '.install' -o -name '*.cmd' \) -delete || die
	# delete empty directories
	find "${ED}" -empty -type d -delete || die
}
