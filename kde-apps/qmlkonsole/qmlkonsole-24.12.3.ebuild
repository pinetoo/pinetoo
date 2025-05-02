# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.240.0
QTMIN=6.5.2
inherit ecm gear.kde.org

DESCRIPTION="Terminal app for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/qmlkonsole/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/kirigami-addons:6
	>=dev-qt/qt5compat-${QTMIN}:6
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kpty-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
"

RDEPEND="${DEPEND}"
