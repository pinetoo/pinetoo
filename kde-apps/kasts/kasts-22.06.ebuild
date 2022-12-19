# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.89.0
QTMIN=5.15.0
inherit ecm plasma-mobile.kde.org

DESCRIPTION="Kirigami-based podcast player"
HOMEPAGE="https://apps.kde.org/kasts/"
SRC_URI="mirror://kde/stable/plasma-mobile/$(ver_cut 1-2)/${KDE_ORG_NAME}-${PV}.tar.xz"

LICENSE="GPL-3 LGPL-3+"
SLOT="5"
KEYWORDS="~arm64"
IUSE="networkmanager"

DEPEND="
	dev-libs/qtkeychain
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsql-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/syndication-${KFMIN}:5
	>=kde-frameworks/threadweaver-${KFMIN}:5
	media-libs/taglib
	networkmanager? ( >=kde-frameworks/networkmanager-qt-${KFMIN}:5 )
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"
