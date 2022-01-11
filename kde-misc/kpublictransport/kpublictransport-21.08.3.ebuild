# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.15.0
KFMIN=5.59.0
KDE_GEAR=true
inherit ecm kde.org

DESCRIPTION="Library to assist with accessing public transport timetables and other data"
HOMEPAGE="https://invent.kde.org/libraries/kpublictransport"

LICENSE="LGPL-2+ ODbL-1.0"
SLOT="5"
KEYWORDS="~arm64"
IUSE="osm"

DEPEND="
	dev-libs/protobuf
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	sys-libs/zlib
	osm? ( sci-geosciences/osmctools )
"

RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"
