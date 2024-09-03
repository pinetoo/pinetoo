# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
EGIT_REPO_URI="https://git.libcamera.org/libcamera/libcamera.git"
EGIT_COMMIT="v${PV}"

inherit git-r3 meson python-any-r1

DESCRIPTION="Camera support library for Linux"
HOMEPAGE="http://libcamera.org"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="debug doc drm gstreamer libevent jpeg python qt6 sdl test trace udev unwind v4l2"
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
		test? ( >=dev-cpp/gtest-1.10.0 )
	)
	python? (
		dev-python/pybind11
	)
	qt6? (
		dev-libs/libatomic_ops
		dev-qt/qtbase:6[gui,opengl,widgets]
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
		app-text/doxygen
		dev-texlive/texlive-latexextra
		media-gfx/graphviz
		$(python_gen_any_dep 'dev-python/sphinx[${PYTHON_USEDEP}]')
	)
"

python_check_deps() {
	python_has_version "dev-python/jinja[${PYTHON_USEDEP}]" &&
	python_has_version "dev-python/ply[${PYTHON_USEDEP}]" &&
	python_has_version "dev-python/pyyaml[${PYTHON_USEDEP}]" &&
	if use doc; then
		python_has_version "dev-python/sphinx[${PYTHON_USEDEP}]"
	fi
}

src_configure() {
	local emesonargs=(
		$(meson_feature doc documentation)
		$(meson_feature libevent cam)
		$(meson_feature qt6 qcam)
		$(meson_feature gstreamer)
		$(meson_feature python pycamera)
		$(meson_use test)
		$(meson_feature udev)
		$(meson_use v4l2)
	)
	if use libevent; then
		emesonargs+=($(meson_feature test lc-compliance))
	fi
	meson_src_configure
}
