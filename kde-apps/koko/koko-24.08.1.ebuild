# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.5.0
KFMIN=5.240.0

inherit ecm gear.kde.org

DESCRIPTION="Image gallery application designed for desktop and touch devices"
HOMEPAGE="https://apps.kde.org/koko/"

LICENSE="LGPL-2+ LGPL-2.1 LGPL-2.1+ LGPL-3 BSD CC0-1.0 CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	media-gfx/exiv2:=
	>=dev-qt/qtbase-${QTMIN}:6[sql,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtpositioning-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kdeclarative-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kfilemetadata-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	media-libs/kquickimageeditor:6
	x11-libs/libxcb
"

RDEPEND="${DEPEND}
	dev-libs/kirigami-addons
	>=dev-qt/qtmultimedia-${QTMIN}:6"

BDEPEND="app-arch/unzip"

src_prepare() {
	cmake_src_prepare

	cp "${FILESDIR}"/{cities1000.zip,admin1CodesASCII.txt,admin2Codes.txt} "${S}/src" || die
}
