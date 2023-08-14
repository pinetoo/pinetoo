# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.94.0
QTMIN=5.14.0
inherit ecm gear.kde.org

DESCRIPTION="Web browser for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/angelfish/"

LICENSE="GPL-2+ LGPL-2 LGPL-2+ MIT"
SLOT="5"
KEYWORDS="~arm64"
IUSE="haptic"

DEPEND="
	>=dev-libs/kirigami-addons-0.6
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtpositioning-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsql-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
	>=dev-qt/qtwebchannel-${QTMIN}:${SLOT}
	>=dev-qt/qtwebengine-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
	>=kde-frameworks/purpose-${KFMIN}:${SLOT}
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:${SLOT}
	haptic? ( dev-qt/qtfeedback:${SLOT} )
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
"
