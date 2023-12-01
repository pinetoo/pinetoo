# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.86.0
inherit ecm plasma-mobile.kde.org

DESCRIPTION="Settings application for Plasma Mobile"
HOMEPAGE="https://invent.kde.org/plasma-mobile/plasma-settings"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${KDE_ORG_NAME}-${PV}.tar.xz"

LICENSE="|| ( GPL-2 GPL-3 ) LGPL-2.1"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	dev-libs/glib:2
	>=dev-libs/kirigami-addons-0.6
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdbus-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtxml-${QTMIN}:${SLOT}
	>=kde-apps/libkgapi-${PV}:${SLOT}
	>=kde-frameworks/kauth-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdeclarative-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kio-${KFMIN}:${SLOT}
	>=kde-frameworks/modemmanager-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/networkmanager-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/solid-${KFMIN}:${SLOT}
	>=kde-plasma/libplasma-${KFMIN}:${SLOT}
	x11-apps/maliit-keyboard
"

RDEPEND="${DEPEND}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/kitemmodels-${KFMIN}:${SLOT}
"
