# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="$(ver_cut 1-2)-megi"
EGIT_COMMIT="8722bb026c1132559a68ea29e3744c4e4bf0cdf0"

inherit git-r3 kernel-2 kernel-build
detect_version

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://megous.com/git/linux"
SRC_URI="${KERNEL_URI}
	https://xff.cz/kernels/${KV_MAJOR}.${KV_MINOR}/patches/all.patch -> ${PV}-megi.patch"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug"

PATCHES=(
	"${DISTDIR}/${PV}-megi.patch"
	"${WORKDIR}/${P}/0101-arm64-dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/0102-arm64-dts-pinephone-pro-remove-modem-node.patch"
	"${WORKDIR}/${P}/0103-ccu-sun50i-a64-reparent-clocks-to-lower-speed-oscillator.patch"
	"${WORKDIR}/${P}/0104-quirk-kernel-org-bug-210681-firmware_rome_error.patch"
	"${WORKDIR}/${P}/0105-leds-gpio-make-max_brightness-configurable.patch"
	"${WORKDIR}/${P}/0106-panic-led.patch"
	"${WORKDIR}/${P}/0008-arm64-dts-allwinner-a64-h5-Add-CPU-idle-states.patch"
	"${WORKDIR}/${P}/0083-media-ov5640-Update-last-busy-timestamp-to-reset-aut.patch"
)

src_unpack() {
	kernel-2_src_unpack
	git-r3_src_unpack
}

src_prepare() {
	default
	cp "${WORKDIR}/${P}/config" .config || die

	echo 'CONFIG_LOCALVERSION="-pinetoo"' > "${T}"/version.config || die
	echo "CONFIG_UEVENT_HELPER_PATH=" >> "${T}"/systemd.config || die
	cat <<-EOF > "${T}"/lxc.config || die
	CONFIG_CHECKPOINT_RESTORE=y
	CONFIG_UNIX_DIAG=m
	CONFIG_PACKET_DIAG=m
	CONFIG_NETLINK_DIAG=m
	EOF
	local merge_configs=(
		"${T}"/version.config
		"${T}"/systemd.config
		"${T}"/lxc.config
	)

	kernel-build_merge_configs "${merge_configs[@]}"
}
