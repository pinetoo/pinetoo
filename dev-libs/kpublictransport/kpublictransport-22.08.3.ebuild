# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="true"
KFMIN=5.96.0
QTMIN=5.15.5
inherit ecm gear.kde.org

DESCRIPTION="Library for accessing public transport timetables and other information"
HOMEPAGE="https://invent.kde.org/libraries/kpublictransport
	https://www.volkerkrause.eu/2019/03/02/kpublictransport-introduction.html"

LICENSE="LGPL-2+ osm? ( ODbL-1.0 )"
SLOT="5"
KEYWORDS="~arm64"
IUSE="osm"

RDEPEND="
	dev-libs/protobuf:=
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5[ssl]
	sys-libs/zlib
	osm? ( sci-geosciences/osmctools )
"
DEPEND="${RDEPEND}
	test? ( >=dev-qt/qtwidgets-${QTMIN}:5 )
"
