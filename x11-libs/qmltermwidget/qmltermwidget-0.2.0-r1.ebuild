# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="QML port of qtermwidget"
HOMEPAGE="https://github.com/Swordfish90/qmltermwidget"
SRC_URI="https://github.com/Swordfish90/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="dev-qt/qtdeclarative:5"
RDEPEND="${DEPEND}
	dev-qt/qtquickcontrols2:5"

PATCHES=(
	"${FILESDIR}/${P}-gcc10.patch"
	"${FILESDIR}/${P}-kprocess-rename.patch"
)

src_configure() {
	eqmake5 "${PN}.pro"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
