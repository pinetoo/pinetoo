# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.15.0
KFMIN=5.85.0

inherit ecm kde.org

DESCRIPTION="Manage digital health certificates like vaccination, test, and recovery"
HOMEPAGE="https://apps.kde.org/vakzination/"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-libs/khealthcertificate-${PV}:${SLOT}
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=kde-apps/kitinerary-${PV}:${SLOT}
	>=kde-apps/kmime-${PV}:${SLOT}
	>=kde-apps/kpkpass-${PV}:${SLOT}
	>=kde-frameworks/karchive-${KFMIN}:${SLOT}
	>=kde-frameworks/kcalendarcore-${KFMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcontacts-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/prison-${KFMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
"

DEPEND="${DEPEND}"
