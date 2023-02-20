# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info

DESCRIPTION="GLib-style interface to binder"
HOMEPAGE="https://github.com/mer-hybris/libgbinder"
SRC_URI="https://github.com/mer-hybris/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	dev-libs/glib:2
	dev-libs/libglibutil
	"
RDEPEND="${DEPEND}"

CONFIG_CHECK="
	~ANDROID_BINDERFS
	~ANDROID_BINDER_IPC
"

src_compile() {
	emake LIBDIR=/usr/$(get_libdir)
}

src_install() {
	emake LIBDIR=/usr/$(get_libdir) DESTDIR="${D}" install-dev
	insinto /etc
	doins "${FILESDIR}/gbinder.conf"
}
