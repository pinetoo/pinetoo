# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.5.2
KFMIN=5.240.0

inherit ecm kde.org

MY_PN="maui-${PN}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Calendar application built with MauiKit"
HOMEPAGE="https://invent.kde.org/maui/maui-agenda"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${MY_P}.tar.xz"

S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	=dev-libs/mauikit-4*
	=dev-libs/mauikit-calendar-4*
	>=dev-qt/qtbase-${QTMIN}:6[widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
"

RDEPEND="${DEPEND}"
