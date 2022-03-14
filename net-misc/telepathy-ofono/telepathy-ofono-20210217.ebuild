# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="8436bc4c4d1c6156bf6c573e701e9650f5faacf0"
EGIT_REPO_URI="https://github.com/TelepathyIM/${PN}.git"

inherit cmake git-r3

DESCRIPTION="Telepathy oFono connection manager"
HOMEPAGE="https://github.com/TelepathyIM/telepathy-ofono"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	dev-libs/libofono-qt
	net-im/telepathy-mission-control
	"

src_configure() {
	local mycmakeargs=(
		-DOFONO_ON_RING:BOOL=ON
	)

	cmake_src_configure
}
