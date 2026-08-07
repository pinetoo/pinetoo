# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.12
QTMIN=6.5.0
inherit ecm gear.kde.org

DESCRIPTION="Public Transport Assistance for Mobile Devices"
HOMEPAGE="https://apps.kde.org/ktrip/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/kirigami-addons:6
	>=dev-libs/kpublictransport-${PV}:6
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
"

RDEPEND="${DEPEND}"
