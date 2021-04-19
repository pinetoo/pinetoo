# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.12.0
KFMIN=5.63.0

MY_PV="v${PV}"
MY_P="${PN}-${MY_PV}"

inherit ecm kde.org

DESCRIPTION="Image gallery application designed for desktop and touch devices"
HOMEPAGE="https://apps.kde.org/keysmith/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-3+ LGPL-2.1 LGPL-3 BSD-2 CC0-1.0 CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-libs/libsodium-1.0.16
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtcore-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
"

DEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	cmake_src_prepare

	echo 'MimeType=x-scheme-handler/otpauth' >> "${S}/org.kde.${PN}.desktop" || die
	sed -i 's/^Exec=keysmith$/Exec=keysmith %u/' "${S}/org.kde.${PN}.desktop" || die
}
