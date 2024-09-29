# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.6.0
KFMIN=6.2.0
inherit ecm plasma.kde.org

MY_PV="v${PV}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Breeze-inspired QQC2 Style"
HOMEPAGE="https://invent.kde.org/plasma/qqc2-breeze-style"

LICENSE="GPL-2+ LGPL-2.1 LGPL-2+ LGPL-3"
SLOT="6"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcolorscheme-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/kquickcharts-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kiconthemes-${KFMIN}:6
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kquickcharts-${KFMIN}:6
"
