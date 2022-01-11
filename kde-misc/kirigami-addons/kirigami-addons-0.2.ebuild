# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.70.0
QTMIN=5.15.0
inherit ecm kde.org

DESCRIPTION="Add-ons for the Kirigami framework"
HOMEPAGE="https://invent.kde.org/libraries/kirigami-addons"
SRC_URI="mirror://kde/unstable/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+ || ( LGPL-3 GPL-2 GPL-3 )"

SLOT="0"

KEYWORDS="~arm64"

IUSE="doc"

DEPEND="
	sys-devel/gettext
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtcore-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=kde-frameworks/kitemmodels-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:5
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_QCH:BOOL=$(use doc && echo ON || echo OFF)
	)

	cmake_src_configure
}
