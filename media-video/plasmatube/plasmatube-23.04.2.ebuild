# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.81.0
QTMIN=5.15.0
PYTHON_COMPAT=( python3_{10..12} )
inherit ecm gear.kde.org python-single-r1

DESCRIPTION="Kirigami YouTube video player based on QtMultimedia and youtube-dl"
HOMEPAGE="https://apps.kde.org/plasmatube/"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="dev-util/pkgconf"

DEPEND="${PYTHON_DEPS}
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=dev-qt/qtgui-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtquickcontrols2-${QTMIN}:${SLOT}
	>=dev-qt/qtsvg-${QTMIN}:${SLOT}
	>=dev-qt/qttest-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	media-video/mpv
	>=kde-frameworks/kconfig-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
"

RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:${SLOT}
	>=dev-qt/qtmultimedia-${QTMIN}:${SLOT}
	$(python_gen_cond_dep '
		net-misc/yt-dlp[${PYTHON_USEDEP}]
	')
"
