# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.240.0
QTMIN=6.5.2

inherit ecm kde.org

DESCRIPTION="Contacts and dialer application"
HOMEPAGE="https://mauikit.org/apps/communicator/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/maui-${P}.tar.xz"

S="${WORKDIR}/maui-${P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kcontacts-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kpeople-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
"

RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PV}-missing_kiogui.patch" )
