# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.81.0
QTMIN=5.15.0
PYTHON_COMPAT=( python3_{8..11} )
inherit ecm plasma-mobile.kde.org python-single-r1

DESCRIPTION="Client for YouTube Music"
HOMEPAGE="https://apps.kde.org/audiotube/"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-python/pybind11
	~dev-python/ytmusicapi-0.24.0
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kcrash-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	$(python_gen_cond_dep '
		net-misc/yt-dlp[${PYTHON_USEDEP}]
	')
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtmultimedia-${QTMIN}:${SLOT}
"

src_configure() {
	local mycmakeargs=(
		-DPYTHON_EXECUTABLE="${PYTHON}"
	)
	ecm_src_configure
}
