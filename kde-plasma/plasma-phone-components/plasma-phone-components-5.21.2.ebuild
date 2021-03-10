# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.78.0
QTMIN=5.15.0
inherit ecm kde.org

MY_P="${PN}-v${PV}"

DESCRIPTION="General UI components for Plasma Phone"
HOMEPAGE="https://invent.kde.org/plasma/plasma-phone-components"
SRC_URI="https://invent.kde.org/plasma/${PN}/-/archive/v${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kwayland-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5[wayland]
"
RDEPEND="
	net-misc/ofono
	net-libs/libqofono
	${DEPEND}
"

S="${WORKDIR}/${MY_P}"
