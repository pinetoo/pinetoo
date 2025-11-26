# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.240.0
QTMIN=6.5.2

inherit ecm kde.org

DESCRIPTION="Multi-platform media player"
HOMEPAGE="https://vvave.kde.org"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtbase-${QTMIN}:6[dbus,network,sql,xml,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	media-libs/taglib
"

RDEPEND="${DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6
"
