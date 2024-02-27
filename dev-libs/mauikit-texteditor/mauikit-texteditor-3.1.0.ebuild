# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.91.0

inherit ecm kde.org

DESCRIPTION="MauiKit Text Editor components"
HOMEPAGE="https://mauikit.org/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+ BSD-2 CC0-1.0"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/syntax-highlighting-${KFMIN}:5
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/sonnet-${KFMIN}:5
	media-libs/kquickimageeditor
"
