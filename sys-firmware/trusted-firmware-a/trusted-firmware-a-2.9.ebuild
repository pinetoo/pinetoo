# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Trusted Firmware for A profile Arm CPUs"
HOMEPAGE="https://www.trustedfirmware.org/"
SRC_URI="https://git.trustedfirmware.org/TF-A/${PN}.git/snapshot/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm64"
IUSE="arm_plat_a3700 arm_plat_a5ds arm_plat_a70x0 arm_plat_a70x0_amc arm_plat_a70x0_mochabin arm_plat_a80x0 arm_plat_a80x0_mcbin arm_plat_a80x0_puzzle arm_plat_agilex arm_plat_arm_fpga arm_plat_axg arm_plat_corstone1000 arm_plat_corstone700 arm_plat_fvp arm_plat_fvp_r arm_plat_fvp_ve arm_plat_g12a arm_plat_gxbb arm_plat_gxl arm_plat_hikey arm_plat_hikey960 arm_plat_imx8mm arm_plat_imx8mn arm_plat_imx8mp arm_plat_imx8mq arm_plat_imx8qm arm_plat_imx8qx arm_plat_juno arm_plat_k3 arm_plat_ls1028ardb arm_plat_ls1043ardb arm_plat_ls1046afrwy arm_plat_ls1046aqds arm_plat_ls1046ardb arm_plat_ls1088aqds arm_plat_ls1088ardb arm_plat_lx2160aqds arm_plat_lx2160ardb arm_plat_lx2162aqds arm_plat_morello arm_plat_msm8916 arm_plat_mt8173 arm_plat_mt8183 arm_plat_mt8186 arm_plat_mt8188 arm_plat_mt8192 arm_plat_mt8195 arm_plat_n1sdp arm_plat_n5x arm_plat_picopi arm_plat_poplar arm_plat_px30 arm_plat_qemu arm_plat_qemu_sbsa arm_plat_rcar arm_plat_rde1edge arm_plat_rdn1edge arm_plat_rdn2 arm_plat_rdv1 arm_plat_rdv1mc arm_plat_rk3288 arm_plat_rk3328 arm_plat_rk3368 arm_plat_rk3399 arm_plat_rpi3 arm_plat_rpi4 arm_plat_rzg arm_plat_sc7180 arm_plat_sc7280 arm_plat_sgi575 arm_plat_stingray arm_plat_stm32mp1 arm_plat_stratix10 arm_plat_sun50i_a64 arm_plat_sun50i_h6 arm_plat_sun50i_h616 arm_plat_sun50i_r329 arm_plat_synquacer arm_plat_t9130 arm_plat_t9130_cex7_eval arm_plat_tc arm_plat_tegra arm_plat_uniphier arm_plat_versal arm_plat_versal_net arm_plat_warp7 arm_plat_zynqmp"
REQUIRED_USE="^^ ( ${IUSE} )"

pkg_pretend() {
	if ! has_version cross-arm-none-eabi/gcc && [[ ${MERGE_TYPE} != binary ]]; then
		eerror "cross-arm-none-eabi/gcc is required to build this package."
		eerror "To install it:"
		eerror "	emerge --ask sys-devel/crossdev"
		eerror "	crossdev --stable --target arm-none-eabi"
		die
	fi
}

src_compile() {
	unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
	for p in ${IUSE}; do
		if use ${p}; then
			PLAT="$(echo "${p}" | sed "s/^arm_plat_//")"
			break
		fi
	done
	emake PLAT="${PLAT}"
}

src_install() {
	insinto "/usr/share/trusted-firmware"
	doins "build/${PLAT}/release/bl31/bl31.elf"
}
