# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.2
KFMIN=5.87.0

inherit ecm gear.kde.org

DESCRIPTION="Image gallery application designed for desktop and touch devices"
HOMEPAGE="https://apps.kde.org/koko/"

LICENSE="LGPL-2+ LGPL-2.1 LGPL-2.1+ LGPL-3 BSD CC0-1.0 CC-BY-SA-4.0"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	media-gfx/exiv2:=
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
	>=dev-qt/qtsql-${QTMIN}:${SLOT}
	>=dev-qt/qtpositioning-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtx11extras-${QTMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kdeclarative-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kio-${KFMIN}:${SLOT}
	>=kde-frameworks/kguiaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/kfilemetadata-${KFMIN}:${SLOT}
	>=kde-frameworks/kpackage-${KFMIN}:${SLOT}
	>=kde-frameworks/kservice-${KFMIN}:${SLOT}
	>=kde-frameworks/kcompletion-${KFMIN}:${SLOT}
	>=kde-frameworks/kitemviews-${KFMIN}:${SLOT}
	>=kde-frameworks/kjobwidgets-${KFMIN}:${SLOT}
	>=kde-frameworks/solid-${KFMIN}:${SLOT}
	>=kde-frameworks/kauth-${KFMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kxmlgui-${KFMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
	x11-libs/libxcb
"

RDEPEND="${DEPEND}
	dev-libs/kirigami-addons
	media-libs/kquickimageeditor
	>=dev-qt/qtmultimedia-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/purpose-${KFMIN}:${SLOT}
	>=kde-plasma/libplasma-${KFMIN}:${SLOT}"

BDEPEND="app-arch/unzip"

src_prepare() {
	cmake_src_prepare

	cp "${FILESDIR}"/{cities1000.zip,admin1CodesASCII.txt,admin2Codes.txt} "${S}/src" || die
}
