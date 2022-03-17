# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.12.0
inherit cmake

DESCRIPTION="C++ Coroutines for Qt"
HOMEPAGE="https://qcoro.dvratil.cz/"
SRC_URI="https://github.com/danvratil/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="5"
KEYWORDS="~arm64"

IUSE="+dbus examples +network test"
RESTRICT="!test? ( test )"

RDEPEND="
	>dev-qt/qtcore-${QTMIN}:5
	>dev-qt/qtconcurrent-${QTMIN}:5
	>dev-qt/qtgui-${QTMIN}:5
	>dev-qt/qtwidgets-${QTMIN}:5
	>dev-qt/qtdeclarative-${QTMIN}:5
	dbus? ( >dev-qt/qtdbus-${QTMIN}:5 )
	network? ( >dev-qt/qtnetwork-${QTMIN}:5 )
"

DEPEND="${RDEPEND}
	test? ( >dev-qt/qttest-${QTMIN}:5 )
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING:BOOL=$(use test && echo ON || echo OFF)
		-DQCORO_BUILD_EXAMPLES:BOOL=$(use examples && echo ON || echo OFF)
		-DQCORO_WITH_QTDBUS:BOOL=$(use dbus && echo ON || echo OFF)
		-DQCORO_WITH_QTNETWORK:BOOL=$(use network && echo ON || echo OFF)
		-DUSE_QT_VERSION=${SLOT}
	)

	cmake_src_configure
}
