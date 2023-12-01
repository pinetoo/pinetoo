# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.93.0
inherit ecm plasma-mobile.kde.org

DESCRIPTION="Phone book for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/phonebook/"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${KDE_ORG_NAME}-${PV}.tar.xz"

LICENSE="GPL-3 LGPL-2+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	dev-libs/kpeoplevcard
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcontacts-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/kpeople-${KFMIN}:${SLOT}
"

RDEPEND="
	${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols-${QTMIN}:${SLOT}
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:${SLOT}
	>=kde-plasma/libplasma-${KFMIN}:${SLOT}
"
