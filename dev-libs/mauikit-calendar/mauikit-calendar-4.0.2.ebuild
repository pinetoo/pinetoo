# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.4.0
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="Calendar support components for Maui applications"
HOMEPAGE="https://invent.kde.org/maui/mauikit-calendar"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+ BSD-2 CC0-1.0"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	>=dev-qt/qt5compat-${QTMIN}:6
	>=dev-qt/qtbase-${QTMIN}:6
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	kde-apps/akonadi:6
	kde-apps/akonadi-calendar:6
	kde-apps/akonadi-contacts:6
	kde-apps/akonadi-mime:6
	kde-apps/kcalutils:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:6
"
