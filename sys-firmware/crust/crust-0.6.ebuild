# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="SCP (power management) firmware for sunxi SoCs"
HOMEPAGE="https://github.com/crust-firmware/crust"
SRC_URI="https://github.com/crust-firmware/crust/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( BSD GPL-2 )"
SLOT="0"
KEYWORDS="~arm64"
PLATS="crust_plat_bananapi_m2_plus_h3 crust_plat_beelink_gs1 crust_plat_beelink_x2 crust_plat_libretech_all_h3_cc_h3 crust_plat_libretech_all_h3_cc_h5 crust_plat_nanopi_a64 crust_plat_nanopi_m1 crust_plat_nanopi_m1_plus crust_plat_orangepi_2 crust_plat_orangepi_3 crust_plat_orangepi_lite crust_plat_orangepi_one crust_plat_orangepi_pc2 crust_plat_orangepi_pc crust_plat_orangepi_pc_plus crust_plat_orangepi_plus2e crust_plat_orangepi_plus crust_plat_orangepi_win crust_plat_orangepi_zero crust_plat_orangepi_zero_plus crust_plat_pine64-lts crust_plat_pine64_plus crust_plat_pine_h64 crust_plat_pinebook crust_plat_pinephone crust_plat_pinetab crust_plat_tanix_tx6 crust_plat_tbs_a711 crust_plat_teres_i"
IUSE="debug ${PLATS}"
REQUIRED_USE="^^ ( ${PLATS} )"

pkg_pretend() {
	if ! has_version cross-or1k-elf/gcc && [[ ${MERGE_TYPE} != binary ]]; then
		eerror "cross-or1k-elf/gcc is required to build this package."
		eerror "To install it:"
		eerror "	emerge --ask sys-devel/crossdev"
		eerror "	crossdev --stable --target or1k-elf"
		die
	fi
}

src_configure() {
	for p in ${PLATS}; do
		if use ${p}; then
			emake CROSS_COMPILE=or1k-elf- "$(echo "${p}" | sed "s/^crust_plat_//")"_defconfig
			break
		fi
	done
	if use debug; then
		sed -i -e '/^\(# \)\?CONFIG_DEBUG_LOG[ =].*/d' -e "\$a\\CONFIG_DEBUG_LOG=$(usex debug y n)" .config
	fi
}

src_compile() {
	emake CROSS_COMPILE=or1k-elf- build/scp/scp.bin
}

src_install() {
	insinto /usr/share/crust
	doins build/scp/scp.bin
}
