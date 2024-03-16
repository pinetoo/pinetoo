# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.102.0
QTMIN=5.15.2
inherit ecm plasma.kde.org

DESCRIPTION="General UI components for Plasma Phone"
HOMEPAGE="https://plasma-mobile.org"

LICENSE="GPL-2+ LGPL-2+ || ( GPL-2 GPL-3 ) || ( LGPL-2.1 LGPL-3 )"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/glib:2
	>=dev-libs/kirigami-addons-0.6
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdbus-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=kde-frameworks/bluez-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/kcmutils-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfigwidgets-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kauth-${KFMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kjobwidgets-${KFMIN}:${SLOT}
	>=kde-frameworks/kdeclarative-${KFMIN}:${SLOT}
	>=kde-frameworks/kio-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/kpackage-${KFMIN}:${SLOT}
	>=kde-frameworks/kservice-${KFMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
	>=kde-frameworks/modemmanager-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/networkmanager-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/solid-${KFMIN}:${SLOT}
	>=kde-plasma/kde-cli-tools-${PV}:${SLOT}
	>=kde-plasma/kwayland-${KFMIN}:${SLOT}
	>=kde-plasma/kwin-${PV}:${SLOT}
	>=kde-plasma/libplasma-${KFMIN}:${SLOT}[wayland]
	>=kde-plasma/plasma-nano-${PV}:${SLOT}
	>=kde-plasma/plasma-nm-${PV}:${SLOT}
	>=kde-plasma/plasma-pa-${PV}:${SLOT}
	>=kde-plasma/plasma-workspace-${PV}:${SLOT}
	media-libs/freetype
	media-libs/fontconfig
"

RDEPEND="${DEPEND}
	dev-qt/qtfeedback
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=kde-frameworks/bluez-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/kitemmodels-${KFMIN}:${SLOT}
	>=kde-frameworks/knewstuff-${KFMIN}:${SLOT}
	>=kde-plasma/kpipewire-${PV}:${SLOT}
	>=kde-plasma/milou-${PV}:${SLOT}
	>=kde-plasma/plasma-activities-${KFMIN}:${SLOT}
"
