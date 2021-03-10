# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.73.0
QTMIN=5.15.2
inherit ecm kde.org

MY_P="${PN}-v${PV}"

DESCRIPTION="Dialer for Plasma Mobile"
HOMEPAGE="https://invent.kde.org/plasma-mobile/plasma-dialer"
SRC_URI="https://invent.kde.org/plasma-mobile/${PN}/-/archive/v${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	sys-devel/gettext
	dev-qt/qtcore:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	dev-qt/qtsql:5
	dev-qt/qtdbus:5
	dev-qt/qtnetwork:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kpeople-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kcontacts-${KFMIN}:5
	net-libs/telepathy-qt
	media-sound/pulseaudio
"
DEPEND="
	virtual/pkgconfig
	${DEPEND}
"

S="${WORKDIR}/${MY_P}"
