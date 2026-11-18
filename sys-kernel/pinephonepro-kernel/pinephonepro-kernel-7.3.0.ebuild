# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_BRANCH="ppp-$(ver_cut 1).$(ver_cut 2)"
EGIT_REPO_URI="https://codeberg.org/LogicalErzor/linux.git"
CONFIG_COMMIT="6c3e3bcd3c6b30b9148cbe8ff88e5e8168b78972"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://codeberg.org/megi/linux"
SRC_URI="https://gitlab.nura.eco/nura/pmaports/-/raw/${CONFIG_COMMIT}/device/community/linux-pine64-pinephonepro/config-pine64-pinephonepro.aarch64 -> ${P}.config"
#S="${WORKDIR}/linux"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug efi"

PATCHES=( "${FILESDIR}/${PV}-disable_modem_claim.patch" )

src_unpack() {
	default
	git-r3_src_unpack
}

src_prepare() {
	default
	cp "${DISTDIR}/${P}.config" .config || die

	echo "CONFIG_EFI_ZBOOT=$(usex efi y n)" > "${T}"/efiboot.config || die

	echo "CONFIG_NETFILTER_XT_CONNMARK=y" > "${T}"/wireguard.config || die

	echo "CONFIG_ANDROID_BINDERFS=y" > "${T}"/waydroid.config || die

	echo "CONFIG_LOCALVERSION=\"-megi-pmos-pinetoo\"" > "${T}"/version.config || die

	kernel-build_merge_configs "${T}"/{efiboot,version,waydroid,wireguard}.config
}
