# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.5.0
QTMIN=6.4.0
PYTHON_COMPAT=( python3_{10..13} )
inherit ecm gear.kde.org python-single-r1

DESCRIPTION="Client for YouTube Music"
HOMEPAGE="https://apps.kde.org/audiotube/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-db/futuresql
	dev-libs/kirigami-addons:6
	dev-libs/qcoro
	dev-python/pybind11
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,dbus,gui,sql,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=dev-python/ytmusicapi-1.10.1
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	$(python_gen_cond_dep '
		net-misc/yt-dlp[${PYTHON_USEDEP}]
	')
"

RDEPEND="${DEPEND}
	>=kde-frameworks/purpose-${KFMIN}:6
"

src_configure() {
	local mycmakeargs=(
		-DPYTHON_EXECUTABLE="${PYTHON}"
	)
	ecm_src_configure
}
