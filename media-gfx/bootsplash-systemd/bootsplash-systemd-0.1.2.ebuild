# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/charveey/bootsplash-systemd.git"
EGIT_BRANCH="master"
EGIT_COMMIT="aa67a5b80c31de78452de408d5093fecb875aea3"

inherit git-r3 systemd

DESCRIPTION="Systemd service files for kernel bootsplash"
HOMEPAGE="https://github.com/charveey/bootsplash-systemd"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	app-shells/bash
	sys-apps/coreutils
	sys-apps/systemd
"

DEPEND="${DEPEND}"

src_install() {
	systemd_dounit bootsplash-*.{path,service}
}
