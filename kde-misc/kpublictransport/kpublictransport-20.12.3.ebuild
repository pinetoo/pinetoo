# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.11.0
KFMIN=5.59.0
inherit ecm kde.org

MY_PV="v${PV}"
MY_P="${PN}-v${PV}"

DESCRIPTION="Library to assist with accessing public transport timetables and other data"
HOMEPAGE="https://invent.kde.org/libraries/kpublictransport"
SRC_URI="https://invent.kde.org/libraries/${PN}/-/archive/${MY_PV}/${MY_P}.tar.bz2"

S="${WORKDIR}/${MY_P}"

LICENSE="BSD CC0-1.0 LGPL-2+ MIT ODbL-1.0"
SLOT="5"
KEYWORDS="~arm64"
IUSE="osm"

DEPEND="
	sys-libs/zlib
	dev-libs/protobuf
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	osm? ( sci-geosciences/osmctools )
"

RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"
