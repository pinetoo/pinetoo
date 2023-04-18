# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.89.0
QTMIN=5.15.2
inherit ecm plasma-mobile.kde.org

DESCRIPTION="Dialer for Plasma Mobile"
HOMEPAGE="https://invent.kde.org/plasma-mobile/plasma-dialer"

LICENSE="|| ( GPL-2 GPL-3 ) || ( LGPL-2.1 LGPL-3 )"
SLOT="5"
KEYWORDS="~arm64"
IUSE="+lockscreen"

DEPEND="
	dev-libs/libphonenumber
	dev-libs/mpris-qt5
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdbus-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}[localstorage]
	>=dev-qt/qtfeedback-20180903:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcontacts-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/kpeople-${KFMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
	>=kde-frameworks/modemmanager-qt-${KFMIN}:${SLOT}
	media-libs/fontconfig
	media-libs/freetype
	media-sound/callaudiod
	lockscreen? (
		dev-libs/plasma-wayland-protocols
		>=dev-qt/qtwayland-${QTMIN}:${SLOT}
		>=dev-qt/qtwaylandscanner-${QTMIN}:${SLOT}
	)
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	dev-libs/kirigami-addons
	lockscreen? ( >=kde-plasma/kwin-5.26.4:${SLOT} )
"
