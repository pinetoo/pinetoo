# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.240.0
QTMIN=6.4.0
inherit ecm gear.kde.org

DESCRIPTION="Web browser for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/angelfish/"

LICENSE="GPL-2+ LGPL-2 LGPL-2+ MIT"
SLOT="0"
KEYWORDS="~arm64"
IUSE="adblocker"
RESTRICT="adblocker? ( network-sandbox )"

DEPEND="
	dev-db/futuresql
	dev-libs/kirigami-addons:6
	dev-libs/qcoro
	dev-libs/qtkeychain
	>=dev-qt/qtbase-${QTMIN}:6[gui,sql,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=dev-qt/qtwebengine-${QTMIN}:6[qml]
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
	adblocker? ( dev-build/corrosion )
"

RDEPEND="${DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6
"
