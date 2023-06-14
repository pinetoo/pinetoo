# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..11} )
EGIT_REPO_URI="https://git.libcamera.org/libcamera/libcamera.git"
EGIT_COMMIT="v${PV}"

inherit git-r3 meson python-any-r1

DESCRIPTION="Camera support library for Linux"
HOMEPAGE="http://libcamera.org"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="debug doc drm gstreamer libevent jpeg python qt5 sdl test trace udev udev unwind v4l2"
REQUIRED_USE="drm? ( libevent ) jpeg? ( sdl ) sdl? ( libevent )"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-libs/libyaml
	>=net-libs/gnutls-3.3:=
	libevent? (
		dev-libs/libevent
		drm? ( x11-libs/libdrm )
		jpeg? ( media-libs/libjpeg-turbo )
		sdl? ( media-libs/libsdl2 )
	)
	gstreamer? ( media-libs/gstreamer )
	libevent? (
		test? ( dev-cpp/gtest )
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		media-libs/tiff
	)
	trace? ( dev-util/lttng-ust )
	udev? ( virtual/libudev )
	unwind? ( sys-libs/libunwind )
"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-libs/openssl
	|| (
		net-libs/gnutls
		dev-libs/openssl
	)
	$(python_gen_any_dep 'dev-python/jinja[${PYTHON_USEDEP}]')
	$(python_gen_any_dep 'dev-python/ply[${PYTHON_USEDEP}]')
	$(python_gen_any_dep 'dev-python/pyyaml[${PYTHON_USEDEP}]')
	doc? (
		app-doc/doxygen
		dev-texlive/texlive-latexextra
		media-gfx/graphviz
		$(python_gen_any_dep 'dev-python/sphinx[${PYTHON_USEDEP}]')
	)
"

src_configure() {
	local emesonargs=(
		$(meson_feature doc documentation)
		$(meson_feature libevent cam)
		$(meson_feature qt5 qcam)
		$(meson_feature gstreamer)
		$(meson_feature python pycamera)
		$(meson_use test)
		$(meson_use v4l2)
		--buildtype $(usex debug debug plain)
	)
	if use libevent; then
		emesonargs+=($(meson_feature test lc-compliance))
	fi
	meson_src_configure
}
