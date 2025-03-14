# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=${PV/_/.}
MY_P="${PN}-${MY_PV}"

inherit gnome2-utils meson rust

DESCRIPTION="Take pictures and videos"
HOMEPAGE="https://gitlab.gnome.org/GNOME/snapshot"
SRC_URI="https://gitlab.gnome.org/GNOME/snapshot/-/archive/${MY_PV}/${MY_P}.tar.bz2"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
IUSE="libcamera"
RESTRICT="network-sandbox"

BDEPEND="
	virtual/pkgconfig
"

RDEPEND="
	dev-libs/glib:2
	gui-libs/gtk:4
	>=gui-libs/libadwaita-1.4:1
	media-libs/gst-plugins-base:1.0
	media-libs/gst-plugins-bad:1.0
	media-libs/gstreamer:1.0
	media-video/pipewire[gstreamer]
	media-video/wireplumber
	libcamera? ( media-libs/libcamera[gstreamer] )
"

DEPEND="${RDEPEND}
	dev-libs/appstream
	dev-util/desktop-file-utils
	dev-util/gtk-update-icon-cache
	sys-devel/gettext
"

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	gnome2_schemas_update
}
