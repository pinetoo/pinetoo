# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KERNEL_TAG="20231104-22589"
CONFIG_COMMIT="c0b5f13420577c140d7c9aa86268ef13a7b6930c"

inherit kernel-build

MY_PV="ppp-$(ver_cut 1-2)-${KERNEL_TAG}"
MY_P="linux-${MY_PV}"

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE="https://gitlab.com/pine64-org/linux"
SRC_URI="https://gitlab.com/pine64-org/linux/-/archive/${MY_PV}/${MY_P}.tar.bz2
	https://gitlab.com/postmarketOS/pmaports/-/raw/${CONFIG_COMMIT}/device/community/linux-pine64-pinephonepro/config-pine64-pinephonepro.aarch64 -> ${MY_PV}.config"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug"

src_prepare() {
	default
	cp "${DISTDIR}/${MY_PV}.config" .config || die

	echo "CONFIG_LOCALVERSION=\"-${MY_PV}\"" > "${T}"/version.config || die

	kernel-build_merge_configs "${T}"/version.config
}
