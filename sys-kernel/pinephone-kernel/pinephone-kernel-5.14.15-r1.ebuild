# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="5.14-megi"
EGIT_COMMIT="8a2f16540aa83e2a02f60cb277c5e85e78bc8ecc"

KERNEL_TAG="5.14-20211018-0417"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://megous.com/git/linux"
SRC_URI="https://github.com/megous/linux/archive/refs/tags/orange-pi-${KERNEL_TAG}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE="systemd"

PATCHES=(
	"${WORKDIR}/${P}/5.14.12-13.patch"
	"${WORKDIR}/${P}/5.14.13-14.patch"
	"${WORKDIR}/${P}/5.14.14-15.patch"
	"${FILESDIR}/Add-supply-for-i2c-bus-to-anx7688.patch"
	"${FILESDIR}/Workaround-broken-HDMI-HPD-signal.patch"
	"${FILESDIR}/Return-error-from-probe-when-reading-chip-version-fails.patch"
	"${FILESDIR}/Add-support-for-i2c-bus-supply.patch"
	"${WORKDIR}/${P}/Allow-to-accept-HPD-status-from-other-drivers.patch"
	"${FILESDIR}/Export-HDMI-HPD-status-over-extcon-to-other-drivers.patch"
	"${WORKDIR}/${P}/ccu-sun50i-a64-reparent-clocks-to-lower-speed-oscillator.patch"
	"${WORKDIR}/${P}/d1d849cae12db71aa81ceedaedc1b17a34790367.patch"
	"${WORKDIR}/${P}/2423aac2d6f5db55da99e11fd799ee66fe6f54c6.patch"
	"${WORKDIR}/${P}/enable-hdmi-output-pinetab.patch"
	"${WORKDIR}/${P}/enable-jack-detection-pinetab.patch"
	"${WORKDIR}/${P}/pinetab-bluetooth.patch"
	"${WORKDIR}/${P}/pinetab-accelerometer.patch"
	"${WORKDIR}/${P}/dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/media-ov5640-Implement-autofocus.patch"
	"${WORKDIR}/${P}/0011-dts-pinetab-hardcode-mmc-numbers.patch"
	"${WORKDIR}/${P}/0107-quirk-kernel-org-bug-210681-firmware_rome_error.patch"
	"${WORKDIR}/${P}/0177-leds-gpio-make-max_brightness-configurable.patch"
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
	if use systemd; then
		echo "CONFIG_BPF_SYSCALL=y" >> .config || die
		echo "CONFIG_CGROUP_BPF=y" >> .config || die
	fi
	kernel-build_src_configure
}
