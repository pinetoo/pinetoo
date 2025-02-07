# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.5.2
KFMIN=5.240.0

inherit ecm kde.org

MY_PN="maui-${PN}"
MY_PV="v${PV}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="A simple minimal IDE for the Linux phones"
HOMEPAGE="https://invent.kde.org/maui/maui-strike"
SRC_URI="https://invent.kde.org/maui/${MY_PN}/-/archive/${MY_PV}/${MY_P}.tar.bz2"

S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	=dev-libs/mauikit-4*
	=dev-libs/mauikit-filebrowsing-4*
	=dev-libs/mauikit-texteditor-4*
	=dev-libs/mauikit-terminal-4*
	>=dev-qt/qtbase-${QTMIN}:6[widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:6
"
