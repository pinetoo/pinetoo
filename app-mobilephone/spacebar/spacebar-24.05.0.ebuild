# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.6.0
KFMIN=6.0.0
inherit ecm gear.kde.org

DESCRIPTION="SMS Application for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/spacebar/"
SRC_URI="mirror://kde/stable/${PN}/${KDE_ORG_NAME}-${PV}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="nls"

BDEPEND="virtual/pkgconfig"

DEPEND="
	dev-libs/libphonenumber
	dev-libs/kirigami-addons:6
	dev-libs/qcoro[dbus]
	dev-db/futuresql
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,gui,widgets,sql]
	>=dev-qt/qtdeclarative-${QTMIN}:6[sql]
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kcontacts-${KFMIN}:6
	>=kde-frameworks/kpeople-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-frameworks/modemmanager-qt-${KFMIN}:6
	net-dns/c-ares
	net-misc/curl
"

RDEPEND="${DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6
"

PATCHES=( "${FILESDIR}/24.05.0-duplicate-definitions.patch" )