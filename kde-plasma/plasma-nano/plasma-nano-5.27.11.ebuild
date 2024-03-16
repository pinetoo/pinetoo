# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.102.0
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="A minimal Plasma shell package intended for embedded devices"
HOMEPAGE="https://invent.kde.org/plasma/plasma-nano"
SRC_URI="mirror://kde/stable/plasma/${PV}/${P}.tar.xz"

LICENSE="GPL-2+ LGPL-2+ MIT"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	sys-devel/gettext
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
	>=kde-frameworks/kpackage-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/knewstuff-${KFMIN}:${SLOT}
	>=kde-frameworks/kservice-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-plasma/kwayland-${KFMIN}:${SLOT}
	>=kde-plasma/libplasma-${KFMIN}:${SLOT}
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=kde-frameworks/kdeclarative-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	kde-plasma/plasma-workspace:${SLOT}
"
