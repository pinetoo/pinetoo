# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.0
KFMIN=5.88.0
inherit ecm plasma-mobile.kde.org

DESCRIPTION="SMS Application for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/spacebar/"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~arm64"
IUSE="nls"

BDEPEND="virtual/pkgconfig"

DEPEND="
	dev-libs/libphonenumber
	dev-libs/qcoro5
	>=dev-qt/qtconcurrent-${QTMIN}:${SLOT}
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdbus-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtxml-${QTMIN}:${SLOT}
	>=dev-qt/qtsql-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=dev-qt/qtxmlpatterns-${QTMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcontacts-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kpeople-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/modemmanager-qt-${KFMIN}:${SLOT}
	net-dns/c-ares
	net-misc/curl
	nls? ( sys-devel/gettext )
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
"
