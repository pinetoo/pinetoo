# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.88.0
QTMIN=5.15.0
inherit ecm gear.kde.org

DESCRIPTION="Public Transport Assistance for Mobile Devices"
HOMEPAGE="https://apps.kde.org/ktrip"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	sys-devel/gettext
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kitemmodels-${KFMIN}:${SLOT}
	>=dev-libs/kpublictransport-21.08:${SLOT}
"

RDEPEND="${DEPEND}
	>=dev-libs/kirigami-addons-0.2
	>=dev-qt/qtquickcontrols-${QTMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
"
