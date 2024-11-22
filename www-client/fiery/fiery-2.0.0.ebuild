# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.5.2
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="A convergent web browser"
HOMEPAGE="https://invent.kde.org/maui/maui-fiery"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/maui-${P}.tar.xz"

S="${WORKDIR}/maui-${P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	=dev-libs/mauikit-4*
	=dev-libs/mauikit-filebrowsing-4*
	>=dev-qt/qtbase-${QTMIN}:6[sql,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtwebengine-${QTMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
"

RDEPEND="${DEPEND}"
