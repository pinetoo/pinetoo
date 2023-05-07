# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.0
KFMIN=5.95.0

inherit ecm plasma-mobile.kde.org

DESCRIPTION="Calendar application for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/calindori/"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${KDE_ORG_NAME}-${PV}.tar.xz"

LICENSE="GPL-3+ LGPL-3+ BSD-2 CC0-1.0 CC-BY-SA-4.0"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=dev-qt/qtdbus-${QTMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kcalendarcore-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/kpeople-${KFMIN}:${SLOT}
"

RDEPEND="${DEPEND}"

BDEPEND=">=dev-qt/linguist-tools-${QTMIN}:${SLOT}"
