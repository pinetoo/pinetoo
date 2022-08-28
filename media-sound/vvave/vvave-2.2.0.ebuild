# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.40.0
QTMIN=5.15.2

MY_P="${PN}-v${PV}"

inherit ecm kde.org

DESCRIPTION="Multi-platform media player"
HOMEPAGE="https://vvave.kde.org"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-accounts-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsql-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=media-libs/taglib-1.4
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5
"

S="${WORKDIR}/${MY_P}"
