# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.77.0
QTMIN=5.15.0

MY_PN="${PN}-fm"
MY_P="${MY_PN}-${PV}"

inherit ecm kde.org

DESCRIPTION="Multi-platform file manager"
HOMEPAGE="https://mauikit.org/apps/index/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${MY_P}.tar.xz"

S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-3 BSD-2 CC0-1.0"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	~dev-libs/mauikit-${PV}
	dev-libs/mauikit-documents
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/karchive-${KFMIN}:5
	>=kde-frameworks/kauth-${KFMIN}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kitemviews-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kjobwidgets-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	>=kde-frameworks/solid-${KFMIN}:5
"

DEPEND="${RDEPEND}
	~dev-libs/mauikit-texteditor-${PV}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
"
