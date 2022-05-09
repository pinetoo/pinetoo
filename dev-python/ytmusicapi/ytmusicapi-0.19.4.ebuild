# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Unofficial API for YouTube Music"
HOMEPAGE="https://ytmusicapi.readthedocs.io/"
SRC_URI="https://github.com/sigma67/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~arm64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"
