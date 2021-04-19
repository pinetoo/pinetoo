# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.5.0
KFMIN=5.18.0

MY_PV="v${PV}"
MY_P="${PN}-${MY_PV}"

inherit ecm kde.org

DESCRIPTION="Cross-platform calculator application built with the Kirigami framework"
HOMEPAGE="https://invent.kde.org/plasma-mobile/kalk"
SRC_URI="mirror://kde/unstable/${PN}/${PV}/${MY_P}.tar.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	sys-devel/bison
	sys-devel/flex
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kunitconversion-${KFMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
"

DEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
