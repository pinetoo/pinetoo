# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="PolicyKit rules for making phone calls with ModemManager"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/pinephone/modemmanager-pp"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="
	net-misc/modemmanager
	sys-auth/polkit
"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/polkit-1/rules.d
	doins "${FILESDIR}/01-org.pinetoo.modemmanager.rules"
}
