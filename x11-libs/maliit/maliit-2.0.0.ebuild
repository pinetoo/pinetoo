# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2 cmake

DESCRIPTION="Maliit framework core libraries and server"
HOMEPAGE="https://maliit.github.io/"
SRC_URI="https://github.com/${PN}/framework/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3 CC-BY-3.0"
SLOT="5"
KEYWORDS="~arm64"
IUSE="dbus doc glib gtk qt5 test wayland xcb"
REQUIRED_USE="gtk? ( wayland )"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtdeclarative:5
	dev-qt/qtwidgets:5
	virtual/udev
	glib? (
		dev-libs/glib:2
	)
	wayland? (
		dev-libs/wayland
		dev-libs/wayland-protocols
		dev-qt/qtwayland:5
		x11-libs/libxkbcommon
		x11-libs/gtk+:3
	)
	xcb? (
		x11-libs/libxcb
		x11-libs/libXfixes
	)
"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	test? (
		dev-qt/qttest:5
	)
"

S="${WORKDIR}/framework-${PV}"

src_prepare() {
	default
	cmake_src_prepare
	sed -i \
		-e "s_/doc/maliit-framework-doc_/doc/${P}_" \
		-e "s_/doc/maliit-framework_/doc/${P}_" \
		CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-Denable-dbus-activation:BOOL=$(use dbus && echo ON || echo OFF)
		-Denable-docs:BOOL=$(use doc && echo ON || echo OFF)
		-Denable-glib:BOOL=$(use glib && echo ON || echo OFF)
		-Denable-qt5-inputcontext:BOOL=$(use qt5 && echo ON || echo OFF)
		-Denable-tests:BOOL=$(use test && echo ON || echo OFF)
		-Denable-wayland:BOOL=$(use wayland && echo ON || echo OFF)
		-Denable-wayland-gtk:BOOL=$(use gtk && echo ON || echo OFF)
		-Denable-xcb:BOOL=$(use xcb && echo ON || echo OFF)
	)

	cmake_src_configure
}