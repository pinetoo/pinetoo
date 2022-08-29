# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.77.0
QTMIN=5.15.0

MY_P="${PN}-v${PV}"

inherit ecm kde.org

DESCRIPTION="A convergent camera app"
HOMEPAGE="https://invent.kde.org/maui/booth"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/mauikit
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}
	dev-libs/mauikit-filebrowsing
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"

S="${WORKDIR}/${MY_P}"
