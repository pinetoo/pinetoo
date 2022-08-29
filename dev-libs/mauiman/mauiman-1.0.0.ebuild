# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.15.2
KFMIN=5.70.0

MY_P="${PN}-v${PV}"

inherit ecm kde.org

DESCRIPTION="Kit for developing MAUI Apps"
HOMEPAGE="https://mauikit.org/"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

LICENSE="AGPL-3+ GPL-3+ LGPL-2.1"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
"

S="${WORKDIR}/${MY_P}"
