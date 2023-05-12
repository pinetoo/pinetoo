# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 gnome2-utils udev

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/pinephone-manjaro-tweaks.git"
EGIT_COMMIT="375e87423653d8816bbc4141c672a2434ba3f71a"

DESCRIPTION="Manjaro ARM's PinePhone tweaks"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/pinephone-manjaro-tweaks"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="!app-misc/pinephone-manjaro-tweaks"

RDEPEND="${DEPEND}
	libcamera? ( media-video/wireplumber )"

IUSE="libcamera"

src_install() {
	exeinto /etc/profile.d
	doexe manjaro-tweaks.sh gsk-renderer-gl.sh

	insinto /etc/systemd/journald.conf.d
	doins 00-journal-size.conf

	insinto /etc/systemd/logind.conf.d
	doins ignore-power-key.conf

	insinto /usr/share/glib-2.0/schemas
	doins 90_manjaro.gschema.override

	insinto /var/lib/polkit-1/localauthority/10-vendor.d
	doins org.freedesktop.ModemManager1.pkla

	insinto /etc/systemd/system
	doins "${FILESDIR}/ModemManager.service"

	if use libcamera; then
		insinto /etc/wireplumber/main.lua.d
		doins "${FILESDIR}/60-libcamera-nodes-by-default.lua"
	fi
}

pkg_postinst() {
	gnome2_schemas_update
	udev_reload
}

pkg_postrm() {
	gnome2_schemas_update
	udev_reload
}
