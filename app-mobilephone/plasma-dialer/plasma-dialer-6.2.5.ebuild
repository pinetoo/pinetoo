# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.240.0
QTMIN=6.5.0
inherit ecm plasma.kde.org

DESCRIPTION="Dialer for Plasma Mobile"
HOMEPAGE="https://invent.kde.org/plasma-mobile/plasma-dialer"

LICENSE="|| ( GPL-2 GPL-3 ) || ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+haptic +lockscreen"

DEPEND="
	dev-libs/kirigami-addons:6
	dev-libs/libphonenumber
	dev-libs/mpris-qt5
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,sql,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcontacts-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kpeople-${KFMIN}:6
	>=kde-frameworks/modemmanager-qt-${KFMIN}:6
	media-sound/callaudiod
	haptic? ( dev-libs/ktactilefeedback:6 )
	lockscreen? (
		dev-libs/plasma-wayland-protocols
		>=dev-qt/qtwayland-${QTMIN}:6
		dev-qt/qtwaylandscanner
		>=kde-frameworks/kwindowsystem-${KFMIN}:6
	)
"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DDIALER_BUILD_SHELL_OVERLAY:BOOL=$(usex lockscreen ON OFF)
		-DMODEM_SUBSYSTEM:STRING=ModemManager # oFono not implemented in the ebuild yet
	)
	cmake_src_configure
}
