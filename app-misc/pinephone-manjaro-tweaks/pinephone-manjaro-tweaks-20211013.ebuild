# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 systemd udev

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/${PN}.git"
EGIT_COMMIT="85e3b68af5a7663adf3fce2d832387482eb7afd6"

DESCRIPTION="Manjaro ARM's PinePhone tweaks"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/phosh/pinephone-manjaro-tweaks"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"

src_install() {
	exeinto /etc/dconf/db/manjaro.d
	doexe 01-phoc-scaling

	exeinto /etc/dconf/profile/user
	doexe dconf-profile-manjaro

	exeinto /etc/profile.d
	doexe manjaro-tweaks.sh gsk-renderer-gl.sh

	insinto /etc/pulse
	doins pinephone.pa

	insinto /etc/pulse/daemon.conf.d
	doins 90-pinephone.conf

	insinto /etc/systemd/journald.conf.d
	doins 00-journal-size.conf

	insinto /etc/systemd/logind.conf.d
	doins ignore-power-key.conf

	insinto /usr/share/feedbackd/themes
	doins manjaro.json

	insinto /usr/share/glib-2.0/schemas
	doins 90_manjaro.gschema.override

	insinto /var/lib/polkit-1/localauthority/10-vendor.d
	doins org.freedesktop.ModemManager1.pkla

	dobin pinephone-setup-usb-network.sh pinephone-usb-gadget.sh

	systemd_dounit pinephone-setup-usb-network.service pinephone-usb-gadget.service

	udev_dorules 10-pinephone-brightness.rules 10-proximity.rules 20-pinephone-led.rules
}
