# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="true"
KFMIN=5.67.0
QTMIN=5.14.0
inherit ecm

DESCRIPTION="Simple and user-friendly Jabber/XMPP client for every device and platform"
HOMEPAGE="https://www.kaidan.im"
SRC_URI="mirror://kde/unstable/${PN}/${P}.tar.xz"

LICENSE="Apache-2.0 CC-BY-SA-4.0 GPL-3+ GPL-3-with-openssl-exception MIT"
SLOT="5"
KEYWORDS="~arm64"
IUSE="kde nls"

BDEPEND="
	nls? ( >=dev-qt/linguist-tools-${QTMIN}:${SLOT} )
"
DEPEND="
	>=dev-qt/qtconcurrent-${QTMIN}:${SLOT}
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtlocation-${QTMIN}:${SLOT}
	>=dev-qt/qtmultimedia-${QTMIN}:${SLOT}[qml]
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}[ssl]
	>=dev-qt/qtpositioning-${QTMIN}:${SLOT}[qml]
	>=dev-qt/qtquickcontrols-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsql-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:${SLOT}
	<media-libs/zxing-cpp-2
	>=net-libs/qxmpp-1.3.0[omemo]
	kde? ( >=kde-frameworks/knotifications-${KFMIN}:${SLOT} )
	>=dev-qt/qtxml-${QTMIN}:${SLOT}
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DI18N=$(usex nls)
		-DBUILD_TESTS=$(usex test)
		-DUSE_KNOTIFICATIONS=$(usex kde)
		# compile QML at build time
		-DQUICK_COMPILER=ON
	)
	ecm_src_configure
}
