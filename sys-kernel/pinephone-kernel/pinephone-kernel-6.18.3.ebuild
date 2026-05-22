# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://gitlab.postmarketos.org/postmarketOS/pmaports.git"
EGIT_COMMIT="ec2040aad260f21efbfc51e8f536506f8c2a8e6e"

KERNEL_TAG="20260105-0049"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://xff.cz/git/linux"
SRC_URI="https://github.com/Arnavion/linux/archive/refs/tags/orange-pi-$(ver_cut 1).$(ver_cut 2)-${KERNEL_TAG}.tar.gz"
S="${WORKDIR}/linux-orange-pi-$(ver_cut 1).$(ver_cut 2)-${KERNEL_TAG}"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug"

GIT_ROOT="device/community/linux-postmarketos-allwinner"

PATCHES=(
	"${WORKDIR}/${P}/${GIT_ROOT}/0001-dts-add-dontbeevil-pinephone-devkit.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0002-dts-add-pinetab-dev-old-display-panel.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0003-dts-pinetab-add-missing-ohci1.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0004-dts-pinetab-make-audio-routing-consistent-with-pinep.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0005-dts-pinephone-drop-modem-power-node.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0006-drm-panel-simple-Add-Hannstar-TQTM070CB501.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0007-ARM-dts-sun6i-Add-GoClever-Orion-70L-tablet.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0008-drm-panel-simple-Add-Hannstar-HSD070IDW1-A.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0009-ARM-dts-sun6i-Add-Lark-FreeMe-70.2S-tablet.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0010-eMMC-workaround.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0011-arm64-dts-allwinner-orangepi-3-fix-ethernet.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0012-staging-rtl8723cs-fix-CFI-signature-of-rtw_xmit_ent.patch"
)

src_unpack() {
	default
	git-r3_src_unpack
}

src_prepare() {
	default
	cp "${WORKDIR}/${P}/${GIT_ROOT}/config-postmarketos-allwinner.aarch64" .config || die

	echo 'CONFIG_LOCALVERSION="-pinetoo"' > "${T}"/version.config || die
	echo "CONFIG_UEVENT_HELPER_PATH=" > "${T}"/systemd.config || die
	cat <<-EOF > "${T}"/lxc.config || die
	CONFIG_UNIX_DIAG=m
	CONFIG_PACKET_DIAG=m
	CONFIG_NETLINK_DIAG=m
	EOF
	echo "CONFIG_IP_NF_RAW=m" > "${T}"/wireguard.config
	local merge_configs=(
		"${T}"/version.config
		"${T}"/systemd.config
		"${T}"/lxc.config
		"${T}"/wireguard.config
	)

	kernel-build_merge_configs "${merge_configs[@]}"
}
