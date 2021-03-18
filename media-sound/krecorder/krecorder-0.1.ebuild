# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ecm kde.org

MY_P="${PN}-v${PV}"

DESCRIPTION="Audio recorder for Plasma Mobile and other platforms"
HOMEPAGE="https://invent.kde.org/plasma-mobile/krecorder"
SRC_URI="https://invent.kde.org/plasma-mobile/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	sys-devel/gettext
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtnetwork:5
	dev-qt/qtdeclarative:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtmultimedia:5
	dev-qt/qtcore:5
	kde-frameworks/kconfig:5
	kde-frameworks/ki18n:5
	kde-frameworks/kirigami:5
"

DEPEND="${RDEPEND}"
