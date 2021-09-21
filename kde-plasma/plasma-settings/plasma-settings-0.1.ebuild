# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.14.0
KFMIN=5.70.0
inherit ecm kde.org

MY_PV="v${PV}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Settings application for Plasma Mobile"
HOMEPAGE="https://invent.kde.org/plasma-mobile/plasma-settings"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2+ BSD LGPL-2+ LGPL-2.1 || ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	dev-libs/glib:2
	>=kde-frameworks/kauth-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
	>=kde-frameworks/solid-${KFMIN}:5
	x11-apps/maliit-keyboard
"

RDEPEND="${DEPEND}
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/kitemmodels-${KFMIN}:5
	net-libs/libqofono
"