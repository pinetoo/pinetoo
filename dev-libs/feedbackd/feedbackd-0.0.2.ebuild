# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_USE_DEPEND="vapigen"

inherit gnome2-utils meson udev vala

MY_PV=${PV/_pre/+git}
MY_P=${PN}-v${MY_PV}
GMOBILE_COMMIT="1039e7808195d4de367ce2718481641ca8af2427"

KEYWORDS="~arm64"

DESCRIPTION="A daemon to provide feedback triggered by application events"
HOMEPAGE="https://source.puri.sm/Librem5/feedbackd"
SRC_URI="
	https://source.puri.sm/Librem5/${PN}/-/archive/v${MY_PV}/${MY_P}.tar.bz2
	daemon? ( https://gitlab.gnome.org/guidog/gmobile/-/archive/${GMOBILE_COMMIT}/gmobile-${GMOBILE_COMMIT}.tar.bz2 )
"

S=${WORKDIR}/${MY_P}

LICENSE="GPL-3+ LGPL-2.1+"
SLOT="0"
IUSE="+daemon doc +man"

DEPEND="
	dev-libs/glib
	sys-apps/dbus
	daemon? (
		dev-libs/json-glib
		dev-libs/libgudev
		media-libs/gsound
	)
	doc? (
		dev-util/gi-docgen
		dev-python/docutils
	)
	man? ( dev-python/docutils )
"
RDEPEND="${DEPEND}
	acct-group/feedbackd
	x11-themes/sound-theme-freedesktop"
BDEPEND="
	dev-libs/gobject-introspection
	$(vala_depend)
	doc? ( dev-util/gtk-doc-am )
"
PDEPEND="dev-libs/feedbackd-device-themes"

src_unpack() {
	unpack "${MY_P}.tar.bz2"
	if use daemon; then
		cd "${S}/subprojects" || die
		unpack "gmobile-${GMOBILE_COMMIT}.tar.bz2"
		rmdir gmobile && mv "gmobile-${GMOBILE_COMMIT}" gmobile || die
	fi
}

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
		$(meson_use man)
	)
	meson_src_configure
}

src_install() {
	default
	meson_src_install
	insinto /etc/modules-load.d
	doins debian/modules-load.d/feedbackd.conf
	udev_newrules debian/feedbackd.udev 90-feedbackd.rules
}

pkg_postinst() {
	gnome2_schemas_update
	udev_reload in pkg_postinst phase
}
pkg_postrm() {
	gnome2_schemas_update
	udev_reload in pkg_postinst phase
}
