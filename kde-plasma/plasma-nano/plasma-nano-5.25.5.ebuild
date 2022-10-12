# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.94.0
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="A minimal Plasma shell package intended for embedded devices"
HOMEPAGE="https://invent.kde.org/plasma/plasma-nano"
SRC_URI="mirror://kde/stable/plasma/${PV}/${P}.tar.xz"

LICENSE="GPL-2+ LGPL-2+ MIT"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	sys-devel/gettext
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-frameworks/kwayland-${KFMIN}:5
	>=kde-frameworks/kpackage-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/knewstuff-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	kde-plasma/plasma-workspace:5
"
