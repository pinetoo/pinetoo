# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.60.0
QTMIN=5.10.0
inherit ecm kde.org

MY_PV="v${PV}"

DESCRIPTION="Multi-platform media player"
HOMEPAGE="https://vvave.kde.org"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/${MY_PV}/${PN}-v${PV}.tar.bz2"

S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~arm64"

IUSE=""

RDEPEND="
	sys-devel/gettext
	dev-libs/mauikit
	media-libs/taglib
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtsql-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtcore-${QTMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kdelibs4support-${KFMIN}:5
"

DEPEND="${RDEPEND}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtwebengine-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	media-plugins/gst-plugins-meta
"
