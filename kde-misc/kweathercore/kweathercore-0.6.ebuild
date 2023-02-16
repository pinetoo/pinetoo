# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.12.0
KFMIN=5.75.0
inherit ecm kde.org

DESCRIPTION="Library for the retrieval of weather information, including forecasts and alerts"
HOMEPAGE="https://invent.kde.org/libraries/kweathercore"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtpositioning-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=kde-frameworks/kholidays-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

RDEPEND="${DEPEND}"
