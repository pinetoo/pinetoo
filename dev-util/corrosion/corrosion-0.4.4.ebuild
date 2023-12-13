# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="CMake scripts for Rust and C/C++ integration"
HOMEPAGE="https://corrosion-rs.github.io/corrosion/"
SRC_URI="https://github.com/corrosion-rs/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="virtual/rust"
RDEPEND="${DEPEND}"
