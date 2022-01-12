# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.82.0
QTMIN=5.15.0
inherit ecm kde.org

DESCRIPTION="Audio recorder for Plasma Mobile and other platforms"
HOMEPAGE="https://apps.kde.org/krecorder/"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${P}.tar.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	kde-frameworks/kconfig:5
	kde-frameworks/ki18n:5
	kde-frameworks/kirigami:5
"

RDEPEND="${DEPEND}
	dev-qt/qtgraphicaleffects:5
"
