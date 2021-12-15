# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Intelligent predictive text entry platform"
HOMEPAGE="https://presage.sourceforge.io/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="doc +sqlite"

RDEPEND="
	sqlite? ( dev-db/sqlite )"

DEPEND="${RDEPEND}"

BDEPEND="doc? ( app-doc/doxygen )"

src_prepare() {
	default
	eautoreconf
	eautoconf
}

src_configure() {
	econf \
		$(use_enable doc documentation) \
		$(use_enable sqlite) \
		--disable-python-binding # Requires Python 2

	# Somehow, it seems to ignore options passed to configure
	# and still tries to build Python 2 stuff

	sed -i 's/presage_dbus_python_demo\(.1\)\?:/&\nold-&/' apps/dbus/Makefile || die
}
