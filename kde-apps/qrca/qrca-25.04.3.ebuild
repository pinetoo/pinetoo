# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.6.0
KFMIN=6.8.0

inherit ecm gear.kde.org

DESCRIPTION="QR code scanner for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/qrca/"

LICENSE="GPL-3+ LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="networkmanager"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcontacts-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/prison-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	networkmanager? ( >=kde-frameworks/networkmanager-qt-${KFMIN}:6 )
"

RDEPEND="${DEPEND}
	dev-libs/kirigami-addons:6
"
