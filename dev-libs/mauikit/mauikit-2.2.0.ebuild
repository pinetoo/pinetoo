# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.15.0
KFMIN=5.90.0

MY_P="${PN}-v${PV}"

inherit ecm kde.org

DESCRIPTION="Kit for developing MAUI Apps"
HOMEPAGE="https://mauikit.org/"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/mauiman
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtx11extras-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	x11-libs/libxcb
	x11-libs/xcb-util-wm
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/purpose-${KFMIN}:5
"

S="${WORKDIR}/${MY_P}"
