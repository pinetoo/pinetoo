# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.0.0
QTMIN=6.5.0
inherit ecm gear.kde.org

DESCRIPTION="Kirigami YouTube video player based on QtMultimedia and youtube-dl"
HOMEPAGE="https://apps.kde.org/plasmatube/"

LICENSE="GPL-3 || ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="~arm64"

BDEPEND="dev-util/pkgconf"

DEPEND="
	dev-libs/kirigami-addons:6
	dev-libs/qtkeychain
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,dbus,gui,network,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	media-libs/mpvqt:6
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kdeclarative-${KFMIN}:6
	>=kde-frameworks/kitemmodels-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
"
