# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="5.16-megi"
EGIT_COMMIT="73acb917e6a27e1df68f9bd9db982cf04d18819a"

KERNEL_TAG="5.16-20220110-0757"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://megous.com/git/linux"
SRC_URI="https://github.com/megous/linux/archive/refs/tags/orange-pi-${KERNEL_TAG}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="systemd"

PATCHES=(
	"${WORKDIR}/${P}/ccu-sun50i-a64-reparent-clocks-to-lower-speed-oscillator.patch"
	"${WORKDIR}/${P}/d1d849cae12db71aa81ceedaedc1b17a34790367.patch"
	"${WORKDIR}/${P}/2423aac2d6f5db55da99e11fd799ee66fe6f54c6.patch"
	"${WORKDIR}/${P}/dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/media-ov5640-Implement-autofocus.patch"
	"${WORKDIR}/${P}/0107-quirk-kernel-org-bug-210681-firmware_rome_error.patch"
	"${WORKDIR}/${P}/0177-leds-gpio-make-max_brightness-configurable.patch"
	"${WORKDIR}/${P}/panic-led.patch"
	"${WORKDIR}/${P}/0001-revert-garbage-collect-fbdev-scrolling-acceleration.patch"
	"${WORKDIR}/${P}/0002-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch"
	"${WORKDIR}/${P}/0003-revert-fbcon-remove-no-op-fbcon_set_origin.patch"
	"${WORKDIR}/${P}/0004-revert-fbcon-remove-soft-scrollback-code.patch"
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
	if use systemd; then
		echo "CONFIG_BPF_SYSCALL=y" >> .config || die
		echo "CONFIG_CGROUP_BPF=y" >> .config || die
		echo "HAVE_KERNEL_UNCOMPRESSED=y" >> .config || die
	fi
	echo "CONFIG_LOCALVERSION=-pinetoo" >> .config || die
	kernel-build_src_configure
}
