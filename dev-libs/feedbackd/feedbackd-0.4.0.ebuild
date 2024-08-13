# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_USE_DEPEND="vapigen"

inherit gnome2-utils meson udev vala

MY_P=${PN}-v${PV}

DESCRIPTION="A daemon to provide feedback triggered by application events"
HOMEPAGE="https://source.puri.sm/Librem5/feedbackd"
SRC_URI="https://source.puri.sm/Librem5/feedbackd/-/archive/v${PV}/${MY_P}.tar.bz2"

S=${WORKDIR}/${MY_P}

LICENSE="GPL-3+ LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+daemon doc introspection +man test"
RESTRICT="!test? ( test )"
REQUIRED_USE="doc? ( daemon ) introspection? ( daemon ) test? ( daemon )"

DEPEND="
	dev-libs/glib
	dev-libs/gmobile
	sys-apps/dbus
	daemon? (
		dev-libs/gmobile
		dev-libs/json-glib
		dev-libs/libgudev
		media-libs/gsound
	)
	doc? (
		dev-util/gi-docgen
		dev-python/docutils
	)
	man? ( dev-python/docutils )
	test? ( dev-util/umockdev )
"
RDEPEND="${DEPEND}
	acct-group/feedbackd
	x11-themes/sound-theme-freedesktop"
BDEPEND="
	dev-libs/gobject-introspection
	$(vala_depend)
	doc? ( dev-build/gtk-doc-am )
"
PDEPEND="dev-libs/feedbackd-device-themes"

src_prepare() {
	default
	eapply_user
	vala_src_prepare
	sed -i "s%^docs_dir = .*%docs_dir = '/usr/share/gtk-doc'%" doc/meson.build || die
}

src_configure() {
	local emesonargs=(
		$(meson_use daemon)
		$(meson_use doc gtk_doc)
		$(meson_feature introspection)
		$(meson_use man)
		$(meson_use test tests)
	)
	meson_src_configure
}

src_install() {
	default
	meson_src_install
	udev_newrules debian/feedbackd.udev 90-feedbackd.rules
}

pkg_postinst() {
	gnome2_schemas_update
	udev_reload
}
pkg_postrm() {
	gnome2_schemas_update
	udev_reload
}
