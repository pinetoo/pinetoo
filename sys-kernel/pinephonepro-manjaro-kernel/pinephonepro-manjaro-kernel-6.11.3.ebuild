# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephonepro.git"
EGIT_BRANCH="$(ver_cut 1-2)-megi"
EGIT_COMMIT="06d85296c1783e02e6523e1d1cf81c26440d61e2"

KERNEL_TAG="20241010-2301"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephonepro"
SRC_URI="https://codeberg.org/megi/linux/archive/orange-pi-$(ver_cut 1).$(ver_cut 2)-${KERNEL_TAG}.tar.gz"
S="${WORKDIR}/linux"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug"

PATCHES=(
	"${WORKDIR}/${P}/0101-arm64-dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/0102-arm64-dts-pinephone-pro-remove-modem-node.patch"
	"${WORKDIR}/${P}/0103-arm64-dts-rk3399-pinephone-pro-add-modem-RI-pin.patch"
)

src_unpack() {
	default
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
