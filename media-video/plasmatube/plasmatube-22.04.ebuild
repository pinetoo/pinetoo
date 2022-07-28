# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.81.0
QTMIN=5.15.0
PYTHON_COMPAT=( python3_{8..11} )
inherit ecm kde.org python-single-r1

DESCRIPTION="Kirigami YouTube video player based on QtMultimedia and youtube-dl"
HOMEPAGE="https://apps.kde.org/plasmatube/"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${P}.tar.xz"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"

RDEPEND="${DEPEND}
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	$(python_gen_cond_dep '
		net-misc/yt-dlp[${PYTHON_USEDEP}]
	')
"
