# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.73.0
QTMIN=5.15.2
inherit ecm kde.org

MY_P="${PN}-v${PV}"

DESCRIPTION="Dialer for Plasma Mobile"
HOMEPAGE="https://invent.kde.org/plasma-mobile/plasma-dialer"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${P}.tar.xz"

LICENSE="|| ( GPL-2 GPL-3 ) || ( LGPL-2.1 LGPL-3 )"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	dev-libs/libphonenumber
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtsql-${QTMIN}:5
	>=kde-frameworks/kcontacts-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kpeople-${KFMIN}:5
	media-libs/pulseaudio-qt
	net-libs/libqofono
	net-libs/telepathy-qt
"
DEPEND="${RDEPEND}"
