# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.4.0
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="MauiKit Text Editor components"
HOMEPAGE="https://mauikit.org/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+ BSD-2 CC0-1.0"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	>=dev-qt/qtbase-${QTMIN}:6
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/syntax-highlighting-${KFMIN}:6
"

RDEPEND="${DEPEND}
	>=kde-frameworks/sonnet-${KFMIN}:6
"