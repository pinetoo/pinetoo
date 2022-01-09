# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

MY_PV="${PV/_/-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Qt Tactile Feedback"
HOMEPAGE="https://github.com/qt/qtfeedback"
SRC_URI="https://github.com/qt/${PN}/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	dev-qt/qtcore:${SLOT}
	dev-qt/qtdeclarative:${SLOT}
	dev-qt/qtmultimedia:${SLOT}
"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/${PV}-define-version.patch" )

S="${WORKDIR}/${MY_P}"

src_configure() {
	eqmake5 "${PN}.pro" INCPATH="${S}/src/feedback"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
