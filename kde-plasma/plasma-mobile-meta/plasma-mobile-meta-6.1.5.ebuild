# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GEAR_MIN=24.08.1

inherit optfeature

DESCRIPTION="Meta package for a complete Plasma Mobile environment for smartphones"
HOMEPAGE="https://plasma-mobile.org/"

LICENSE="metapackage"
SLOT="6"
KEYWORDS="~arm64"
IUSE="accessibility +bluetooth +desktop-portal +dialer education games +gtk handbook haptic kwallet +pulseaudio +sms systemd thumbnail webengine"

RDEPEND="
	>=app-crypt/keysmith-${GEAR_MIN}
	>=kde-apps/calindori-${GEAR_MIN}
	>=kde-apps/itinerary-${GEAR_MIN}
	>=kde-apps/kaccounts-providers-${GEAR_MIN}:${SLOT}
	>=kde-apps/kalk-${GEAR_MIN}
	>=kde-apps/koko-${GEAR_MIN}
	>=kde-apps/kongress-${GEAR_MIN}
	>=kde-apps/ktrip-${GEAR_MIN}
	>=kde-apps/okular-${GEAR_MIN}:${SLOT}[mobile]
	kde-apps/plasma-phonebook
	kde-apps/plasma-camera
	>=kde-apps/qmlkonsole-${GEAR_MIN}
	>=kde-misc/kclock-${GEAR_MIN}
	>=kde-misc/kdeconnect-${GEAR_MIN}:${SLOT}
	>=kde-misc/kweather-${GEAR_MIN}:${SLOT}
	kde-misc/plymouth-shim
	>=kde-plasma/discover-${PV}:${SLOT}
	>=kde-plasma/kscreen-${PV}:${SLOT}
	>=kde-plasma/kwayland-integration-${PV}:5
	>=kde-plasma/oxygen-${PV}:${SLOT}
	>=kde-plasma/oxygen-sounds-${PV}:${SLOT}
	>=kde-plasma/plasma-mobile-${PV}:${SLOT}
	kde-plasma/plasma-mobile-sounds
	kde-plasma/plasma-settings
	>=kde-plasma/powerdevil-${PV}:${SLOT}
	media-gfx/megapixels
	>=media-sound/audiotube-${GEAR_MIN}
	>=media-sound/kasts-${GEAR_MIN}
	>=media-sound/elisa-${GEAR_MIN}:${SLOT}
	>=media-sound/krecorder-${GEAR_MIN}
	>=media-video/plasmatube-${GEAR_MIN}
	>=media-tv/telly-skout-${GEAR_MIN}
	>=net-im/neochat-${GEAR_MIN}
	>=net-im/tokodon-${GEAR_MIN}
	>=net-news/alligator-${GEAR_MIN}
	>=www-client/angelfish-${GEAR_MIN}
	x11-apps/maliit-keyboard
	x11-misc/sddm
	accessibility? ( >=app-accessibility/kontrast-${GEAR_MIN}:${SLOT} )
	bluetooth? ( >=kde-plasma/bluedevil-${PV}:${SLOT} )
	desktop-portal? ( >=kde-plasma/xdg-desktop-portal-kde-${PV}:${SLOT} )
	dialer? ( >=kde-apps/plasma-dialer-${PV} )
	education? ( webengine? ( >=kde-apps/kalgebra-${GEAR_MIN}:${SLOT} ) )
	games? ( games-kids/gcompris )
	gtk? ( >=kde-plasma/breeze-gtk-${PV}:${SLOT} )
	handbook? ( >=kde-apps/khelpcenter-${PV}:${SLOT} )
	haptic? ( app-mobilephone/hfd-service )
	kwallet? ( >=kde-plasma/kwallet-pam-${PV}:${SLOT} )
	pulseaudio? ( >=kde-plasma/plasma-pa-${PV}:${SLOT} )
	sms? ( app-mobilephone/spacebar )
	systemd? ( media-gfx/bootsplash-systemd )
	thumbnail? (
		>=kde-apps/ffmpegthumbs-${PV}:${SLOT}
		>=kde-apps/thumbnailers-${PV}:${SLOT}
	)
"

pkg_postinst() {
	optfeature "additional convergent applications from the MauiKit suite" maui-apps/maui-meta
}
