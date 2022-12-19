# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.0
KFMIN=5.91.0

inherit ecm plasma-mobile.kde.org

DESCRIPTION="Image gallery application designed for desktop and touch devices"
HOMEPAGE="https://apps.kde.org/keysmith/"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-libs/libsodium-1.0.16
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	sys-auth/oath-toolkit
"

DEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare

	echo 'MimeType=x-scheme-handler/otpauth' >> "${S}/org.kde.${PN}.desktop" || die
	sed -i 's/^Exec=keysmith$/Exec=keysmith %u/' "${S}/org.kde.${PN}.desktop" || die
}
