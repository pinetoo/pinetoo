# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.100.0
QTMIN=5.15.10
inherit ecm gear.kde.org

DESCRIPTION="Itinerary and boarding pass management application"
HOMEPAGE="https://apps.kde.org/itinerary/"

LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="~arm64"
IUSE="+holidays +metadata networkmanager thumbnail"

DEPEND="
	>=dev-libs/khealthcertificate-22.06:${SLOT}
	>=dev-libs/kirigami-addons-0.6
	>=dev-libs/kopeninghours-${PV}:${SLOT}
	>=dev-libs/kosmindoormap-${PV}:${SLOT}
	>=dev-libs/kpublictransport-${PV}:${SLOT}
	dev-libs/libical:0/3
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtdbus-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtlocation-${QTMIN}:${SLOT}
	>=dev-qt/qtmultimedia-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtpositioning-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=kde-apps/kitinerary-${PV}:${SLOT}
	>=kde-apps/kmime-${PV}:${SLOT}
	>=kde-apps/kpkpass-${PV}:${SLOT}
	>=kde-frameworks/karchive-${KFMIN}:${SLOT}
	>=kde-frameworks/kcalendarcore-${KFMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/kcontacts-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kitemmodels-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
	>=kde-frameworks/kunitconversion-${KFMIN}:${SLOT}
	>=kde-frameworks/kwindowsystem-${KFMIN}:${SLOT}
	>=kde-frameworks/prison-${KFMIN}:${SLOT}
	>=kde-frameworks/solid-${KFMIN}:${SLOT}
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:${SLOT}
	>=kde-plasma/libplasma-${KFMIN}:${SLOT}
	net-libs/libquotient
	x11-misc/shared-mime-info
	sys-libs/zlib
	holidays? ( >=kde-frameworks/kholidays-${KFMIN}:${SLOT} )
	metadata? ( >=kde-frameworks/kfilemetadata-${KFMIN}:${SLOT} )
	networkmanager? ( >=kde-frameworks/networkmanager-qt-${KFMIN}:${SLOT} )
	thumbnail? ( >=kde-frameworks/kio-${KFMIN}:${SLOT} )
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
"
