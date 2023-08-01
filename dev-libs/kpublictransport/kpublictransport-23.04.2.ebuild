# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="true"
KFMIN=5.101.0
QTMIN=5.15.10
inherit ecm gear.kde.org

DESCRIPTION="Library for accessing public transport timetables and other information"
HOMEPAGE="https://invent.kde.org/libraries/kpublictransport
	https://www.volkerkrause.eu/2019/03/02/kpublictransport-introduction.html"

LICENSE="LGPL-2+ osm? ( ODbL-1.0 )"
SLOT="5"
KEYWORDS="~arm64"
IUSE="networkmanager osm"

RDEPEND="
	dev-libs/protobuf:=
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}[ssl]
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	sys-libs/zlib
	networkmanager? ( >=kde-frameworks/networkmanager-qt-${KFMIN}:${SLOT} )
	osm? ( sci-geosciences/osmctools )
"
DEPEND="${RDEPEND}
	test? ( >=dev-qt/qtwidgets-${QTMIN}:5 )
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_OsmTools=$(use osm && echo OFF || echo ON)
	)
	ecm_src_configure
}
