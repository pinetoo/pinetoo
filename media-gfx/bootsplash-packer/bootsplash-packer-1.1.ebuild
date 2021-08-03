# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="d8df6b6e38080a14946ffed6773d2b100c519cb8"

DESCRIPTION="Utility to pack kernel bootsplash files"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/extra/bootsplash-packer"
SRC_URI="https://gitlab.manjaro.org/manjaro-arm/packages/extra/bootsplash-packer/-/archive/${COMMIT}/bootsplash-packer-${COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

src_compile() {
	gcc "${CFLAGS}" -o "${PN}" "${PN}.c" || die
}

src_install() {
	dobin "${PN}"
}
