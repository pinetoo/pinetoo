# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
EGIT_REPO_URI="https://git.libcamera.org/libcamera/libcamera.git"
EGIT_COMMIT="v${PV}"

inherit git-r3 meson python-any-r1

DESCRIPTION="Camera support library for Linux"
HOMEPAGE="https://libcamera.org"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="debug doc drm gstreamer libevent jpeg python qt6 sdl trace udev unwind v4l2"
REQUIRED_USE="drm? ( libevent ) jpeg? ( sdl ) sdl? ( libevent )"

RDEPEND="
	dev-cpp/gtest
	dev-libs/libyaml
	dev-util/lttng-ust
	>=net-libs/gnutls-3.3:=
	libevent? (
		dev-libs/libevent
		drm? ( x11-libs/libdrm )
		jpeg? ( media-libs/libjpeg-turbo )
		sdl? ( media-libs/libsdl2 )
	)
	gstreamer? ( media-libs/gstreamer )
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
	$(python_gen_any_dep 'dev-python/jinja2[${PYTHON_USEDEP}]')
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
	python_has_version "dev-python/jinja2[${PYTHON_USEDEP}]" &&
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
		$(meson_feature libevent lc-compliance)
		$(meson_feature qt6 qcam)
		$(meson_feature gstreamer)
		$(meson_feature python pycamera)
		$(meson_feature udev)
		$(meson_feature v4l2)
		# Just disable Raspberry Pi 5 because it requires additional dependecnies
		# and it's out of the scope of this repository
		-Dpipelines=imx8-isi,ipu3,mali-c55,rkisp1,simple,uvcvideo
		-Dipas=ipu3,mali-c55,rkisp1,simple,vimc
	)
	meson_src_configure
}
