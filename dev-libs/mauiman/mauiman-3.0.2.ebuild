# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.107.0

inherit ecm kde.org

DESCRIPTION="Maui Manager Library. Server and public library API"
HOMEPAGE="https://mauikit.org/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	dev-qt/qtsystems
"

RDEPEND="${DEPEND}"

src_configure() {
	# We will wait for Qt6 stabilization in ::gentoo
	local mycmakeargs=(
		-DBUILD_WITH_QT5:BOOL=ON
		-DBUILD_WITH_QT6:BOOL=OFF
	)
	cmake_src_configure
}
