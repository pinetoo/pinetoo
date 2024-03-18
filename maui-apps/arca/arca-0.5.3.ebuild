# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.92.0

inherit ecm kde.org

DESCRIPTION="Maui Archiver for compressed files"
HOMEPAGE="https://invent.kde.org/maui/arca"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/mauikit-filebrowsing
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/karchive-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}
	dev-libs/mauikit
	dev-libs/mauikit-texteditor
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	maui-apps/index
"
