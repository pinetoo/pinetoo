# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.4.0
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="MauiKit Image Tools components"
HOMEPAGE="https://invent.kde.org/maui/mauikit-imagetools"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+ BSD-2 CC0-1.0"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	<app-text/tesseract-5:0
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,gui,sql]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtpositioning-${QTMIN}:6
	kde-apps/libkexiv2:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	media-gfx/exiv2:=
	media-libs/kquickimageeditor:6
	media-libs/leptonica
	media-libs/opencv
"

RDEPEND="${DEPEND}
	>=dev-qt/qtlocation-${QTMIN}:6
"
