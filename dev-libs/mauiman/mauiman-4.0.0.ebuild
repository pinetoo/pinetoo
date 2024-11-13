# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.4.0
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="Maui Manager Library. Server and public library API"
HOMEPAGE="https://mauikit.org/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND=">=dev-qt/qtbase-${QTMIN}:6[dbus,gui]"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_WITH_QT5:BOOL=ON
		-DBUILD_WITH_QT6:BOOL=OFF
	)
	cmake_src_configure
}
