# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info systemd

DESCRIPTION="Container-based approach to boot a full Android system on a regular Linux system"
HOMEPAGE="https://waydro.id/"

SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~arm64"
IUSE="systemd"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	app-containers/lxc
	dev-python/gbinder-python
"

RDEPEND="
	${DEPEND}
	net-dns/dnsmasq
	net-firewall/nftables
"

BDEPEND="virtual/pkgconfig"

CONFIG_CHECK="
	~ANDROID_BINDERFS
	~ANDROID_BINDER_IPC
"

pkg_setup() {
	if kernel_is -lt 5 18; then
		CONFIG_CHECK="
			${CONFIG_CHECK}
			~ASHMEM
		"
	fi
	linux-info_pkg_setup
}

src_install() {
	insinto /etc/gbinder.d

	insinto "/usr/lib/${PN}"
	doins -r data tools waydroid.py

	fperms 755 "/usr/lib/${PN}/${PN}.py" "/usr/lib/${PN}/data/scripts/${PN}-net.sh"

	dosym "../lib/${PN}/${PN}.py" "/usr/bin/${PN}"

	if use systemd; then
		systemd_dounit "systemd/${PN}-container.service"
	else
		newinitd "${FILESDIR}/${PN}-container.initd" "${PN}-container"
	fi
}
