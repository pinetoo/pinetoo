# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.2.0
QTMIN=6.6.0
inherit ecm plasma.kde.org

DESCRIPTION="General UI components for Plasma Phone"
HOMEPAGE="https://plasma-mobile.org"

LICENSE="GPL-2+ LGPL-2+ || ( GPL-2 GPL-3 ) || ( LGPL-2.1 LGPL-3 )"
SLOT="6"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/glib:2
	dev-libs/qcoro
	dev-libs/kirigami-addons:${SLOT}
	>=dev-qt/qtbase-${QTMIN}:${SLOT}[dbus,gui]
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtsensors-${QTMIN}:${SLOT}
	>=kde-frameworks/kcmutils-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfigwidgets-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kglobalaccel-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kio-${KFMIN}:${SLOT}
	>=kde-frameworks/kitemmodels-${KFMIN}:${SLOT}
	>=kde-frameworks/kjobwidgets-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/kpackage-${KFMIN}:${SLOT}
	>=kde-frameworks/kservice-${KFMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
	>=kde-frameworks/modemmanager-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/networkmanager-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/solid-${KFMIN}:${SLOT}
	>=kde-plasma/kwayland-${PV}:${SLOT}
	>=kde-plasma/kwin-${PV}:${SLOT}
	>=kde-plasma/libkscreen-${PV}:${SLOT}
	>=kde-plasma/libplasma-${PV}:${SLOT}
	>=kde-plasma/plasma-workspace-${PV}:${SLOT}
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libepoxy
	x11-libs/libxcb
	virtual/libudev
"

RDEPEND="${DEPEND}
	>=kde-plasma/kpipewire-${PV}:${SLOT}
	>=dev-qt/qt5compat-${QTMIN}:${SLOT}
	>=kde-frameworks/bluez-qt-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdeclarative-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/knewstuff-${KFMIN}:${SLOT}
	>=kde-plasma/milou-${PV}:${SLOT}
	kde-plasma/plasma-mimeapps-list
	>=kde-plasma/plasma-nm-${PV}:${SLOT}
	>=kde-plasma/plasma-nano-${PV}:${SLOT}
	>=kde-plasma/qqc2-breeze-style-${PV}:${SLOT}
	x11-misc/xdg-user-dirs
"

PATCHES=( "${FILESDIR}/${PV}-ecm-qmlmodule.patch" )
