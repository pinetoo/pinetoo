# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.14.0
KFMIN=5.60.0

MY_P="${PN}-v${PV}"

inherit ecm kde.org

DESCRIPTION="Video player and video collection manager"
HOMEPAGE="https://mauikit.org/apps/clip/"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

LICENSE="GPL-3+ LGPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="ffmpeg"

DEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	media-libs/taglib
	ffmpeg? ( media-video/ffmpeg )
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtwebview-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	media-sound/vvave
	media-video/mpv
"

S="${WORKDIR}/${MY_P}"
