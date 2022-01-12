# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/plasma-mobile/plasma-mobile-settings.git"
EGIT_COMMIT="26f977292c7f19f3079882cf223e73d78bbbbfba"

inherit git-r3 gnome2-utils

DESCRIPTION="Settings files for Plasma mobile"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/plasma-mobile/plasma-mobile-settings"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE="systemd"

RDEPEND="acct-user/plasma-mobile"

src_prepare() {
	default

	sed -i "s-/\?usr/lib/org_kde_powerdevil-/usr/$(get_libdir)/libexec/org_kde_powerdevil-" powerdevil.hook || die

	sed -i \
		-e 's/^User=kde$/User=plasma-mobile/' \
		-e 's/^HaltCommand=/#&/' \
		-e 's/^RebootCommand=/#&/' \
		-e 's/^DefaultPath=/#&/' \
		sddm.conf || die
}

src_install() {
	insinto /etc/NetworkManager/conf.d
	doins disable-random-mac.conf
	exeinto /etc/profile.d
	doexe packagekit-offline.sh
	insinto /etc/sddm.conf.d
	newins sddm.conf 00-plasma-mobile.conf
	insinto /etc/skel/.config/gtk-3.0
	doins settings.ini
	insinto /etc/xdg
	doins applications-blacklistrc kdeglobals kwinrc
	exeinto /usr/lib/systemd/system-sleep
	doexe ofono-fast-dormancy.sh
	insinto /usr/share/glib-2.0/schemas/
	doins 91_plasma-mobile.gschema.override
	insinto /usr/share/libalpm/hooks/
	newins powerdevil.hook 90-powerdevil.hook
	insinto /usr/share/maliit/keyboard2/devices/
	doins plasmamobile.json
	insinto /usr/lib/udev/rules.d/
	doins 20-pinephone-led.rules

	if use systemd; then
		insinto /etc/xdg
		doins startkderc
	fi
}

pkg_postinst() {
	gnome2_schemas_update
	einfo "Please update password for plasma-mobile user to be able to log in to Plasma Mobile:"
	einfo "    passwd plasma-mobile"
	einfo "or change the User in /etc/sddm.conf.d/00-plasma-mobile.conf to the one you want to use with Plasma Mobile."
}
