# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Functions useful in mobile related, glib based projects"
HOMEPAGE="https://gitlab.gnome.org/World/Phosh/gmobile"
SRC_URI="https://sources.phosh.mobi/releases/${PN}/${P}.tar.xz"

LICENSE="GPL-3+ LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="doc examples introspection man test udev"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/glib:2
	dev-libs/json-glib
	introspection? ( dev-libs/gobject-introspection )
"
RDEPEND="${DEPEND}
	acct-group/feedbackd
	x11-themes/sound-theme-freedesktop
	!<dev-libs/feedbackd-0.3.0"
BDEPEND="doc? ( dev-util/gi-docgen )"

src_configure() {
	local emesonargs=(
		$(meson_use doc gtk_doc)
		$(meson_use examples)
		$(meson_use introspection)
		$(meson_use man)
		$(meson_use test tests)
		$(meson_use udev hwdb)
	)
	meson_src_configure
}
