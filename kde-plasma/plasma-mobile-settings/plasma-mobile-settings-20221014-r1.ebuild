# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/extra/plasma-mobile-additional/plasma-mobile-settings.git"
EGIT_COMMIT="a806e57b872932ff11cc5e14d4b9fe8db3f86518"

inherit git-r3 gnome2-utils udev

DESCRIPTION="Settings files for Plasma mobile"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/extra/plasma-mobile-additional/plasma-mobile-settings"

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
	insinto /etc/sddm.conf.d
	newins sddm.conf 00-plasma-mobile.conf
	insinto /etc/skel/.config/gtk-3.0
	doins settings.ini
	insinto /etc/skel/.config/autostart
	doins drkonqi-coredump-launcher.desktop
	insinto /etc/xdg
	doins applications-blacklistrc kdeglobals kscreenlockerrc kxkbrc mimeapps.list
	insinto /usr/share/libalpm/hooks/
	newins powerdevil.hook 90-powerdevil.hook
	insinto /lib/udev/rules.d
	doins 20-pinephone-led.rules

	if use systemd; then
		insinto /etc/xdg
		doins startkderc
	fi
}

pkg_postinst() {
	gnome2_schemas_update
	udev_reload
	if [[ "${REPLACING_VERSIONS}" == "" ]]; then
		einfo "Please update password for plasma-mobile user to be able to log in to Plasma Mobile:"
		einfo "	passwd plasma-mobile"
		einfo "or change the User in /etc/sddm.conf.d/00-plasma-mobile.conf to the one you want to use with Plasma Mobile."
	elif [[ "${REPLACING_VERSIONS}" != "${PV}" ]]; then
		ewarn "Previos verions of ${CATEGORY}/${PN} forced the virtual on-screen"
		ewarn "keyboard to x11-apps/maliit-keyboard, which is unmaintained and removed."
		ewarn "The new on-screen keyboard is kde-plasma/plasma-keyboard."
		ewarn "Remove the forced reference to x11-apps/maliit-keyboard with:"
		ewarn "	kwriteconfig6 --file kwinrc --group Wayland --key InputMethod --delete"
		ewarn "as the plasma-mobile user or the user you use for your Plasma Mobile environment."
	fi
}

pkg_postrm() {
	gnome2_schemas_update
	udev_reload
}
