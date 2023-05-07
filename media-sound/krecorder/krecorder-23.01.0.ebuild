# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.89.0
QTMIN=5.15.0
inherit ecm plasma-mobile.kde.org

DESCRIPTION="Audio recorder for Plasma Mobile and other platforms"
HOMEPAGE="https://apps.kde.org/krecorder/"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${KDE_ORG_NAME}-${PV}.tar.xz"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-libs/kirigami-addons-0.6
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtmultimedia-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
"
