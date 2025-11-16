# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.8.0
QTMIN=6.6.0
inherit ecm kde.org xdg

DESCRIPTION="A note-taking and management application using markdown."
HOMEPAGE="https://apps.kde.org/klevernotes/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=dev-qt/qtwebchannel-${QTMIN}:6[qml]
	>=dev-qt/qtwebengine-${QTMIN}:6[qml]
	>=kde-frameworks/kcolorscheme-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kiconthemes-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
"

RDEPEND="${DEPEND}
	dev-libs/kirigami-addons:6
	>=kde-frameworks/kitemmodels-${KFMIN}:6
"
