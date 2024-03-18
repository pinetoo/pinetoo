# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.0
KFMIN=5.60.0

inherit ecm kde.org

DESCRIPTION="Mobile Git repository manager"
HOMEPAGE="https://invent.kde.org/maui/bonsai"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-3+ LGPL-2+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	=dev-libs/mauikit-3*
	=dev-libs/mauikit-filebrowsing-3*
	=dev-libs/mauikit-terminal-3*
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	=dev-libs/mauikit-texteditor-3*
"
