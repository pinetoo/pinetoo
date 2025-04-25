# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.7.0
KFMIN=6.3.0

inherit ecm gear.kde.org

DESCRIPTION="Cross-platform calculator application built with the Kirigami framework"
HOMEPAGE="https://apps.kde.org/kalk/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/kirigami-addons:6
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kunitconversion-${KFMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	sci-libs/libqalculate
"

RDEPEND="${DEPEND}"
