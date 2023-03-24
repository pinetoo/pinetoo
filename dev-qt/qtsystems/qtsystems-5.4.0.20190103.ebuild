# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/qt/qtsystems.git"
EGIT_BRANCH="dev"
EGIT_COMMIT="e3332ee38d27a134cef6621fdaf36687af1b6f4a"

inherit git-r3 qmake-utils

DESCRIPTION="Qt Tactile Feedback"
HOMEPAGE="https://github.com/qt/qtsystems"

LICENSE="LGPL-2.1-with-linking-exception"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="dev-qt/qtcore:${SLOT}
	dev-qt/qtsql:${SLOT}
	dev-qt/qtdbus:${SLOT}"

RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 "${PN}.pro"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
