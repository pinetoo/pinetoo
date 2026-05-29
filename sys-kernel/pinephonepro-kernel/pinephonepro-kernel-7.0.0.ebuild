# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CONFIG_COMMIT="9cb4e481ab2427f5f3259dfdcfad045be0db95dc"

inherit kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://codeberg.org/LogicalErzor/linux"
SRC_URI="https://codeberg.org/LogicalErzor/linux/archive/ppp-megi-$(ver_cut 1).$(ver_cut 2)-stripped.tar.gz
	https://gitlab.postmarketos.org/postmarketOS/pmaports/-/raw/${CONFIG_COMMIT}/device/community/linux-pine64-pinephonepro/config-pine64-pinephonepro.aarch64 -> ${P}.config"
S="${WORKDIR}/linux"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug"

src_prepare() {
	default
	cp "${DISTDIR}/${P}.config" .config || die

	echo "CONFIG_NETFILTER_XT_CONNMARK=y" > "${T}"/wireguard.config || die

	echo "CONFIG_ANDROID_BINDERFS=y" > "${T}"/waydroid.config

	echo "CONFIG_LOCALVERSION=\"-${MY_PV}\"" > "${T}"/version.config || die

	kernel-build_merge_configs "${T}"/{version,waydroid,wireguard}.config
}
