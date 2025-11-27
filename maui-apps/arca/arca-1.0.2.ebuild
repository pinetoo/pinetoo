# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.5.2
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="Maui Archiver for compressed files"
HOMEPAGE="https://invent.kde.org/maui/arca"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	=dev-libs/mauikit-4*
	=dev-libs/mauikit-archiver-4*
	=dev-libs/mauikit-filebrowsing-4*
	>=dev-qt/qtbase-${QTMIN}:6[widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/karchive-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
"

RDEPEND="${DEPEND}
	=dev-libs/mauikit-documents-4*
	=dev-libs/mauikit-texteditor-4*
	=maui-apps/index-4*
"
