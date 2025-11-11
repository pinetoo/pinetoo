# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.3.0
QTMIN=6.6.0
inherit ecm gear.kde.org xdg

DESCRIPTION="Kalm can teach you different breathing techniques."
HOMEPAGE="https://apps.kde.org/kalm/"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/kirigami-addons:6
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:6
"
