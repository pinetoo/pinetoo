# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.5.2
KFMIN=5.240.0

inherit ecm kde.org

DESCRIPTION="Convergent terminal emulator"
HOMEPAGE="https://mauikit.org/apps/station/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/maui-${P}.tar.xz"

S="${WORKDIR}/maui-${P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	~dev-libs/mauikit-terminal-${PV}
	>=dev-qt/qtbase-${QTMIN}:6[dbus,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
"

RDEPEND="${DEPEND}"
