# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.70.0

inherit ecm kde.org

DESCRIPTION="Maui Manager Library. Server and public library API"
HOMEPAGE="https://mauikit.org/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${P}.tar.xz"

LICENSE="AGPL-3+ GPL-3+ LGPL-2.1"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	dev-qt/qtsystems
"
