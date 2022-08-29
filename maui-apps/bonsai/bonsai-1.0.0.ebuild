# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.60.0
QTMIN=5.15.0

MY_P="${PN}-v${PV}"

inherit ecm kde.org

DESCRIPTION="Mobile Git repository manager"
HOMEPAGE="https://invent.kde.org/maui/bonsai"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

LICENSE="LGPL-3 GPL-2"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/libgit2
	dev-libs/mauikit
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}
	dev-libs/mauikit-filebrowsing
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
"

S="${WORKDIR}/${MY_P}"
