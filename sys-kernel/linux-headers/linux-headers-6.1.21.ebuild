# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ETYPE="headers"
H_SUPPORTEDARCH="arm64"

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="6.1-megi"
EGIT_COMMIT="564e82b2ccfb6b49956da37d2cec9281510d876d"

KERNEL_TAG="6.1-20230214-2103"

inherit git-r3 kernel-2
detect_version

SRC_URI="https://github.com/megous/linux/archive/refs/tags/orange-pi-${KERNEL_TAG}.tar.gz"

KEYWORDS="~arm64"

BDEPEND="app-arch/xz-utils
	dev-lang/perl"

PATCHES=(
	"${WORKDIR}/${P}/6.1.12-13.patch"
	"${WORKDIR}/${P}/6.1.13-14.patch"
	"${WORKDIR}/${P}/6.1.14-15.patch"
	"${WORKDIR}/${P}/6.1.15-16.patch"
	"${WORKDIR}/${P}/6.1.16-17.patch"
	"${WORKDIR}/${P}/6.1.17-18.patch"
	"${WORKDIR}/${P}/6.1.18-19.patch"
	"${WORKDIR}/${P}/6.1.19-20.patch"
	"${WORKDIR}/${P}/6.1.20-21.patch"
	"${WORKDIR}/${P}/0101-arm64-dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/0102-arm64-dts-pinephone-pro-remove-modem-node.patch"
	"${WORKDIR}/${P}/0103-ccu-sun50i-a64-reparent-clocks-to-lower-speed-oscillator.patch"
	"${WORKDIR}/${P}/0104-quirk-kernel-org-bug-210681-firmware_rome_error.patch"
	"${WORKDIR}/${P}/0105-leds-gpio-make-max_brightness-configurable.patch"
	"${WORKDIR}/${P}/0106-panic-led.patch"
	"${WORKDIR}/${P}/0008-arm64-dts-allwinner-a64-h5-Add-CPU-idle-states.patch"
	"${WORKDIR}/${P}/0083-media-ov5640-Update-last-busy-timestamp-to-reset-aut.patch"
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

src_unpack() {
	# Avoid kernel-2_src_unpack
	default
	git-r3_src_unpack
}

src_prepare() {
	# TODO: May need forward porting to newer versions
	use elibc_musl && PATCHES+=(
		"${FILESDIR}"/${PN}-5.10-Use-stddefs.h-instead-of-compiler.h.patch
		"${FILESDIR}"/${PN}-5.15-remove-inclusion-sysinfo.h.patch
	)

	# Avoid kernel-2_src_prepare
	default
}

src_install() {
	kernel-2_src_install

	find "${ED}" \( -name '.install' -o -name '*.cmd' \) -delete || die
	# Delete empty directories
	find "${ED}" -empty -type d -delete || die
}
