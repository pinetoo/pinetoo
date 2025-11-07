# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.6.0
KFMIN=6.4.0

inherit ecm gear.kde.org optfeature xdg

DESCRIPTION="Convergent TV guide application"
HOMEPAGE="https://apps.kde.org/telly-skout/"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/kirigami-addons:6
	>=dev-qt/qtbase-${QTMIN}:6[sql,xml,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
"

RDEPEND="${DEPEND}"

pkg_postinst() {
	xdg_desktop_database_update
	optfeature "downloading XMLTV schedules from different sources" media-tv/xmltv
}
