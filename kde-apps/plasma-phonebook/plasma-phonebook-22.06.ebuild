# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.93.0
inherit ecm plasma-mobile.kde.org

DESCRIPTION="Phone book for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/phonebook/"

LICENSE="GPL-3 LGPL-2+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	dev-libs/kpeoplevcard
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcontacts-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/kpeople-${KFMIN}:5
"

RDEPEND="
	${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:5
"
