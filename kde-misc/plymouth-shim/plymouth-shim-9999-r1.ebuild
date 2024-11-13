# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://invent.kde.org/bshah/${PN}.git"

inherit cmake git-r3

DESCRIPTION="Plymouth shim service for offline updates"
HOMEPAGE="https://invent.kde.org/bshah/plymouth-shim"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtquickcontrols2:5
	sys-apps/systemd"

RDEPEND="${DEPEND}
	kde-frameworks/kirigami:5"
