# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.4.0
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="Terminal support components for Maui applications"
HOMEPAGE="https://mauikit.org/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	~dev-libs/mauikit-${PV}
	>=dev-qt/qt5compat-${QTMIN}:6
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kpty-${KFMIN}:6
"

RDEPEND="${DEPEND}
	x11-libs/qmltermwidget
"
