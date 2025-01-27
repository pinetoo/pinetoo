# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.245.0
QTMIN=6.5.0
inherit ecm gear.kde.org

DESCRIPTION="Itinerary and boarding pass management application"
HOMEPAGE="https://apps.kde.org/itinerary/"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="matrix +metadata networkmanager thumbnail"

DEPEND="
	dev-libs/kirigami-addons:6
	>=dev-libs/khealthcertificate-${PV}:6
	>=dev-libs/kopeninghours-${PV}:6
	>=dev-libs/kosmindoormap-${PV}:6
	>=dev-libs/kpublictransport-${PV}:6
	dev-libs/libical:0/3
	dev-libs/qtkeychain
	>=dev-qt/qtbase-${QTMIN}:6[dbus,network,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtlocation-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=dev-qt/qtpositioning-${QTMIN}:6
	>=kde-apps/kitinerary-${PV}:6
	>=kde-apps/kmime-${PV}:6
	>=kde-apps/kpkpass-${PV}:6
	>=kde-frameworks/kcalendarcore-${KFMIN}:6
	>=kde-frameworks/kcontacts-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kholidays-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kitemmodels-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kunitconversion-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-frameworks/prison-${KFMIN}:6
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
	>=kde-frameworks/solid-${KFMIN}:6
	sys-libs/zlib
	x11-misc/shared-mime-info
	matrix? ( net-libs/libquotient )
	metadata? ( >=kde-frameworks/kfilemetadata-${KFMIN}:6 )
	networkmanager? ( >=kde-frameworks/networkmanager-qt-${KFMIN}:6 )
	thumbnail? ( >=kde-frameworks/kio-${KFMIN}:6 )
"

RDEPEND="${DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=dev-libs/kpublictransport-${PV}:6
"
