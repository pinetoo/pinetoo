# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.240.0
QTMIN=6.5.3

MY_PN="${PN}-fm"
MY_P="${MY_PN}-${PV}"

inherit ecm kde.org

DESCRIPTION="Multi-platform file manager"
HOMEPAGE="https://mauikit.org/apps/index/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/${MY_P}.tar.xz"

S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-3 BSD-2 CC0-1.0"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-documents-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	~dev-libs/mauikit-terminal-${PV}
	>=dev-qt/qtbase-${QTMIN}:6[dbus,sql,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=kde-frameworks/karchive-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
"

DEPEND="${RDEPEND}
	~dev-libs/mauikit-texteditor-${PV}
	>=dev-qt/qt5compat-${QTMIN}:6
"
