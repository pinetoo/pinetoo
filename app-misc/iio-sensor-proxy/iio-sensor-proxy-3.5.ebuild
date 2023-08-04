# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Proxies sensor devices to applications through D-Bus"
HOMEPAGE="https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/"
SRC_URI="https://gitlab.freedesktop.org/hadess/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	>=dev-libs/libgudev-237
	sys-auth/polkit[introspection]
	>=sys-apps/systemd-233"

DEPEND="${RDEPEND}"
