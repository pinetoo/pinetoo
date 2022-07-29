# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone.git"
EGIT_BRANCH="5.18-megi"
EGIT_COMMIT="70121640b020b536dc30f54430848f6a3efa2488"

KERNEL_TAG="5.18-20220722-1228"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://megous.com/git/linux"
SRC_URI="https://github.com/megous/linux/archive/refs/tags/orange-pi-${KERNEL_TAG}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug systemd"

PATCHES=(
	"${WORKDIR}/${P}/5.18.13-14.patch"
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

src_unpack() {
	default
	git-r3_src_unpack
}

src_configure() {
	cp "${WORKDIR}/${P}/config" .config || die

	echo 'CONFIG_LOCALVERSION="-pinetoo"' > "${T}"/version.config || die
	echo "CONFIG_NF_TABLES=y" > "${T}"/waydroid.config || die
	echo "HAVE_KERNEL_UNCOMPRESSED=y" >> "${T}"/boot.config || die
	echo "CONFIG_UEVENT_HELPER_PATH=" >> "${T}"/systemd.config || die
	cat <<-EOF > "${T}"/wireguard.config || die
	CONFIG_NF_TABLES=y
	CONFIG_NF_TABLES_IPV4=y
	CONFIG_NF_TABLES_IPV6=y
	CONFIG_NFT_CT=y
	CONFIG_NFT_FIB=y
	CONFIG_NFT_FIB_IPV4=y
	CONFIG_NFT_FIB_IPV6=y
	EOF
	local merge_configs=(
		"${T}"/version.config
		"${T}"/waydroid.config
		"${T}"/boot.config
		"${T}"/wireguard.config
		"${T}"/systemd.config
	)

	kernel-build_merge_configs "${merge_configs[@]}"

	kernel-build_src_configure
}
