# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.70.0
QTMIN=5.15.0
inherit ecm kde.org

DESCRIPTION="Public Transport Assistance for Mobile Devices"
HOMEPAGE="https://apps.kde.org/ktrip"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	sys-devel/gettext
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcontacts-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kitemmodels-${KFMIN}:5
	>=dev-libs/kpublictransport-21.08:5
"

RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-misc/kirigami-addons-0.2
"
