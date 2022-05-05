# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.15.0
KFMIN=5.87.0

inherit ecm kde.org

DESCRIPTION="Image gallery application designed for desktop and touch devices"
HOMEPAGE="https://apps.kde.org/koko/"
SRC_URI="
	mirror://kde/stable/plasma-mobile/${PV}/${P}.tar.xz
	http://download.geonames.org/export/dump/cities1000.zip
	http://download.geonames.org/export/dump/admin1CodesASCII.txt
	http://download.geonames.org/export/dump/admin2Codes.txt
"

LICENSE="LGPL-2+ LGPL-2.1 LGPL-2.1+ LGPL-3 BSD CC0-1.0 CC-BY-SA-4.0"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	media-gfx/exiv2
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtsql-${QTMIN}:5
	>=dev-qt/qtpositioning-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtx11extras-${QTMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kguiaddons-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kfilemetadata-${KFMIN}:5
	>=kde-frameworks/kpackage-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kitemviews-${KFMIN}:5
	>=kde-frameworks/kjobwidgets-${KFMIN}:5
	>=kde-frameworks/solid-${KFMIN}:5
	>=kde-frameworks/kauth-${KFMIN}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	x11-libs/libxcb
"

RDEPEND="${DEPEND}
	media-libs/kquickimageeditor
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/purpose-${KFMIN}:5"

BDEPEND="app-arch/unzip"

src_prepare() {
	cmake_src_prepare

	cp "${DISTDIR}"/{cities1000.zip,admin1CodesASCII.txt,admin2Codes.txt} "${S}/src" || die
}
