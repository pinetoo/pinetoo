# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.5.0
QTMIN=6.7.0
inherit ecm plasma.kde.org

DESCRIPTION="A minimal Plasma shell package intended for embedded devices"
HOMEPAGE="https://invent.kde.org/plasma/plasma-nano"

LICENSE="GPL-2+ LGPL-2+ MIT"
SLOT="6"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kitemmodels-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	>=kde-frameworks/ksvg-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-plasma/kwayland-${PV}:6
	>=kde-plasma/libplasma-${PV}:6
	media-libs/fontconfig
	media-libs/freetype
	virtual/libudev
"

RDEPEND="${DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6
	>=kde-frameworks/kdeclarative-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/knewstuff-${KFMIN}:6
	>=kde-plasma/plasma-workspace-${PV}:6
"
