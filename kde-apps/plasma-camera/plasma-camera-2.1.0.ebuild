# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.0.0
QTMIN=6.6.0
inherit ecm kde.org

DESCRIPTION="Camera application for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/plasma.camera/"
SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=dev-qt/qtsensors-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	media-gfx/exiv2
"
RDEPEND="${DEPEND}
	dev-libs/kirigami-addons:6
"
