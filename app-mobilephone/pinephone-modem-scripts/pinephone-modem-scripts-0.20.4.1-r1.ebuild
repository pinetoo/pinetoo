# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/pinephone-modem-scripts.git"
EGIT_BRANCH="eg25-manager"
EGIT_COMMIT="61c502e01b839c21a2906aff948e7594ce08138a"

inherit git-r3 systemd udev

DESCRIPTION="A collection of scripts for setting up the PinePhone's modem"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/pinephone-modem-scripts"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="modemmanager ofono"
REQUIRED_USE="^^ ( modemmanager ofono )"

DEPEND="
	sys-apps/systemd
	net-misc/atinout
	sci-geosciences/gpsd
	>sys-kernel/pinephone-kernel-5.10.12
	app-mobilephone/eg25-manager
	modemmanager? ( net-misc/modemmanager )
	ofono? ( net-misc/ofono )
"

DEPEND="${DEPEND}"

src_install() {
	exeinto /usr/bin
	if use ofono; then
		newexe pinephone-modem-setup-ofono.sh pinephone-modem-setup.sh
	else
		doexe pinephone-modem-setup.sh
	fi

	insinto /etc/gpsd
	newins gpsd_device-hook.sh device-hook

	insinto $(get_udevdir)/rules.d
	doins 90-modem-eg25.rules

	systemd_dounit gpsd-pinephone.service pinephone-modem-scripts.pinephone-modem-setup.service
}
