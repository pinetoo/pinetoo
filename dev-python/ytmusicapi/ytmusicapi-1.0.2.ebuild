# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1 pypi

DESCRIPTION="Unofficial API for YouTube Music"
HOMEPAGE="https://ytmusicapi.readthedocs.io/"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~arm64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"
