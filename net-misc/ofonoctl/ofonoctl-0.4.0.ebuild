# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{8,9} )

inherit distutils-r1

DESCRIPTION="Command line tool to control the ofono daemon over D-Bus"
HOMEPAGE="https://git.sr.ht/~martijnbraam/ofonoctl"
SRC_URI="https://git.sr.ht/~martijnbraam/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"

IUSE=""

RDEPEND="
	dev-python/dbus-python
	dev-python/tabulate"

DEPEND="${RDEPEND}"
