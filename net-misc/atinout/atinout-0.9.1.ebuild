# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="AT commands as input are sent to modem and responses given as output"
HOMEPAGE="https://foo.example.org/"
SRC_URI="mirror://sourceforge/atinout/v${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

PATCHES=( "${FILESDIR}/${P}-gcc-fallthrough.patch" "${FILESDIR}/${P}-cr.patch" )
