# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KERNEL_TAG="20251104-2007"
CONFIG_COMMIT="8dc1e78cf778405dee27d93d5482760b9f0e5cb6"

inherit kernel-build

MY_PV="ppp-$(ver_cut 1-2)-${KERNEL_TAG}"
MY_P="linux-${MY_PV}"

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://gitlab.com/pine64-org/linux"
SRC_URI="https://gitlab.com/pine64-org/linux/-/archive/${MY_PV}/${MY_P}.tar.bz2
	https://gitlab.postmarketos.org/postmarketOS/pmaports/-/raw/${CONFIG_COMMIT}/device/community/linux-pine64-pinephonepro/config-pine64-pinephonepro.aarch64 -> ${MY_PV}.config"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug"

src_prepare() {
	default
	cp "${DISTDIR}/${MY_PV}.config" .config || die

	cat <<-EOF > "${T}"/wireguard.config || die
	CONFIG_IP_NF_RAW=y
	CONFIG_NETFILTER_XT_CONNMARK=y
	EOF

	echo "CONFIG_LOCALVERSION=\"-${MY_PV}\"" > "${T}"/version.config || die

	kernel-build_merge_configs "${T}"/{version,wireguard}.config
}
