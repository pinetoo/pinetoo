# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Qt and QML MPRIS interface and adaptor"
HOMEPAGE="https://github.com/sailfishos/amber-mpris"
SRC_URI="https://github.com/sailfishos/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="dev-qt/qtbase:6[dbus]"

DEPEND="${RDEPEND}"

src_configure() {
	eqmake6 "amber-mpris.pro"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
