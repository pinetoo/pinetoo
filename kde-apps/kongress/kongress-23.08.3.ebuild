# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.95.0
QTMIN=5.15.2
inherit ecm gear.kde.org

DESCRIPTION="Companion application for conferences"
HOMEPAGE="https://apps.kde.org/kongress"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	sys-devel/gettext
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=dev-qt/qtdbus-${QTMIN}:${SLOT}
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kcalendarcore-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kdbusaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/knotifications-${KFMIN}:${SLOT}
"

DEPEND="${RDEPEND}"
