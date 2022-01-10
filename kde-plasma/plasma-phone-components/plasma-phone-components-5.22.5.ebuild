# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.82.0
QTMIN=5.15.0
inherit ecm kde.org

DESCRIPTION="General UI components for Plasma Phone"
HOMEPAGE="https://invent.kde.org/plasma/plasma-phone-components"

LICENSE="GPL-2+ LGPL-2+ || ( GPL-2 GPL-3 ) || ( LGPL-2.1 LGPL-3 )"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=kde-frameworks/bluez-qt-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kwayland-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5[wayland]
	>=kde-plasma/kwin-${PV}:5
	>=kde-plasma/plasma-nano-${PV}:5
	>=kde-plasma/plasma-nm-${PV}:5
	>=kde-plasma/plasma-pa-${PV}:5
	>=kde-plasma/plasma-workspace-${PV}:5
	net-libs/libqofono
"
RDEPEND="
	net-misc/ofono
	net-libs/libqofono
	${DEPEND}
"
