# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_USE_DEPEND="vapigen"

inherit gnome2-utils meson udev vala

MY_PV=${PV/_pre/+git}
MY_P=${PN}-v${MY_PV}

KEYWORDS="~arm64"

DESCRIPTION="A daemon to provide feedback triggered by application events"
HOMEPAGE="https://source.puri.sm/Librem5/feedbackd"
SRC_URI="https://source.puri.sm/Librem5/${PN}/-/archive/v${MY_PV}/${PN}-v${MY_PV}.tar.bz2"

S=${WORKDIR}/${MY_P}

LICENSE="GPL-3+ LGPL-2.1+"
SLOT="0"

DEPEND="
	dev-libs/glib
	dev-libs/json-glib
	dev-libs/libgudev
	media-libs/gsound
	sys-apps/dbus
"
RDEPEND="${DEPEND}
	acct-group/feedbackd
	x11-themes/sound-theme-freedesktop"
BDEPEND="
	dev-libs/gobject-introspection
	$(vala_depend)
"
PDEPEND="dev-libs/feedbackd-device-themes"

src_prepare() {
	default
	eapply_user
	vala_src_prepare
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
}
