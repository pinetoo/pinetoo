# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info systemd

COMMIT="298bba4"

DESCRIPTION="Sets up zram-based swap devices on boot"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/zswap-arm"
SRC_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/${PN}-arm/-/archive/${COMMIT}/${PN}-arm-${COMMIT}.tar.bz2"

S="${WORKDIR}/${PN}-arm-${COMMIT}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="systemd"

RDEPEND="sys-apps/kmod
	sys-apps/util-linux"

CONFIG_CHECK="
	~SWAP
	~ZRAM
"

src_compile() {
	# Support zram being compiled in kernel instead of as a module
	sed -i 's/\s*\(modprobe\|rmmod\)\s.*/& || true/' zswap-arm-ctrl || die

	if use systemd; then
		cp zswap-arm-ctrl "${PN}"
		sed "s_/usr/lib/systemd/scripts/zswap-arm-ctrl_/etc/init.d/${PN}_" zswap-arm.service > "${PN}.service" || die
	else
		head -n -3 zswap-arm-ctrl > "${PN}" || die
		sed -i '1 s_^.*$_#!/sbin/openrc-run_' "${PN}" || die
	fi
}

src_install() {
	doinitd ${PN}

	if use systemd; then
		systemd_dounit "${PN}.service"
	fi
}
