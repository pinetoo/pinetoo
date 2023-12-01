# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info xdg

DESCRIPTION="Container-based approach to boot a full Android system on a regular Linux system"
HOMEPAGE="https://waydro.id/"

SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~arm64"
IUSE="dbus nftables systemd"
REQUIRED_USE="systemd? ( dbus )"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	app-containers/lxc
	dev-python/gbinder-python
"

RDEPEND="
	${DEPEND}
	dev-python/pygobject
	net-dns/dnsmasq
	dbus? ( dev-python/dbus-python )
	nftables? ( net-firewall/nftables )
	!nftables? ( net-firewall/iptables )
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
	emake \
		USE_DBUS_ACTIVATION=$(usex dbus 1 0) \
		USE_SYSTEMD=$(usex systemd 1 0) \
		USE_NFTABLES=$(usex nftables 1 0) \
		DESTDIR="${D}" install
	newinitd "${FILESDIR}/${PN}-container.initd" "${PN}-container"
}
