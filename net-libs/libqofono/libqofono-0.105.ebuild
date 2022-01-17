# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="A library for accessing the ofono daemon,"
HOMEPAGE="https://github.com/sailfishos/libqofono"
SRC_URI="https://github.com/sailfishos/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="dev-qt/qtdbus:5
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5"

DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/0001-add-support-for-reset-contexts.patch"
	"${FILESDIR}/context-preferred.patch"
	"${FILESDIR}/mtk_settings_binding.patch"
)

src_configure() {
	eqmake5 "${PN}.pro"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
