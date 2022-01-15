# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.60.0
QTMIN=5.14.0
inherit ecm kde.org

DESCRIPTION="Multi-platform text editor"
HOMEPAGE="https://mauikit.org/apps/nota/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}
	~dev-libs/mauikit-texteditor-${PV}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"