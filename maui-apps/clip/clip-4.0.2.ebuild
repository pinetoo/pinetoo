# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.5.2
KFMIN=5.240.0

inherit ecm gear.kde.org

DESCRIPTION="Video player and video collection manager"
HOMEPAGE="https://mauikit.org/apps/clip/"
SRC_URI="mirror://kde/stable/maui/${PN}/${PV}/maui-${P}.tar.xz"

S="${WORKDIR}/maui-${P}"

LICENSE="GPL-3+ LGPL-3+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	~dev-libs/mauikit-${PV}
	~dev-libs/mauikit-filebrowsing-${PV}
	>=dev-qt/qtbase-${QTMIN}:6[dbus,sql,network,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	media-libs/taglib
	media-video/ffmpeg
	media-video/mpv
"

RDEPEND="${DEPEND}
	>=dev-qt/qtwebview-${QTMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	~media-sound/vvave-${PV}
"
