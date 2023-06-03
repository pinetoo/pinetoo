# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/pinephone-modem-scripts.git"
EGIT_BRANCH="eg25-manager"
EGIT_COMMIT="cefcd46502acca9bd396c885df445a712c8c4eff"

inherit git-r3 systemd udev

DESCRIPTION="A collection of scripts for setting up the PinePhone's modem"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/pinephone-modem-scripts"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="modemmanager ofono"
REQUIRED_USE="^^ ( modemmanager ofono )"

RDEPEND="
	sys-apps/systemd
	net-misc/atinout
	|| ( >sys-kernel/pinephone-kernel-5.10.12 >sys-kernel/pinephonepro-kernel-5.10.12 )
	app-mobilephone/eg25-manager
"

src_install() {
	exeinto /usr/sbin
	doexe pinephone-modem-setup.sh

	insinto $(get_udevdir)/rules.d
	doins 90-modem-eg25.rules

	systemd_dounit pinephone-modem-scripts.pinephone-modem-setup.service
}
