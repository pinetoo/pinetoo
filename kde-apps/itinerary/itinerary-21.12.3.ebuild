# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.85.0
QTMIN=5.15.0
inherit ecm kde.org

DESCRIPTION="Itinerary and boarding pass management application"
HOMEPAGE="https://apps.kde.org/itinerary/"

LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-libs/khealthcertificate-$(ver_cut 1-2):5
	>=dev-libs/kopeninghours-${PV}:5
	>=dev-libs/kosmindoormap-${PV}:5
	>=dev-libs/kpublictransport-${PV}:5
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtlocation-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtpositioning-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-apps/kitinerary-${PV}:5
	>=kde-apps/kmime-${PV}:5
	>=kde-apps/kpkpass-${PV}:5
	>=kde-frameworks/karchive-${KFMIN}:5
	>=kde-frameworks/kcalendarcore-${KFMIN}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/kcontacts-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/kholidays-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/networkmanager-qt-${KFMIN}:5
	>=kde-frameworks/prison-${KFMIN}:5
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:5
	>=kde-frameworks/solid-${KFMIN}:5
	x11-misc/shared-mime-info
	sys-libs/zlib
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"
