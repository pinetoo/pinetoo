# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://invent.kde.org/plasma-mobile/plasma-mobile-sounds.git"
EGIT_COMMIT="34a28c44e433fa4e4062bf91129882f0671ea9f5"

inherit git-r3 ecm kde.org

DESCRIPTION="Sounds for Plasma Mobile devices"
HOMEPAGE="https://invent.kde.org/plasma-mobile/plasma-mobile-sounds"
SRC_URI=""

LICENSE="CC0-1.0 CC-BY-4.0 CC-BY-SA-4.0"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

src_unpack() {
	git-r3_src_unpack
}
