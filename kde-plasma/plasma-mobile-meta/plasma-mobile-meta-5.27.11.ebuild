# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GEAR_MIN=23.08.5

inherit optfeature

DESCRIPTION="Meta package for a complete Plasma Mobile environment for smartphones"
HOMEPAGE="https://www.plasma-mobile.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="accessibility +bluetooth +desktop-portal +dialer education games +gtk handbook haptic kwallet +pulseaudio +sms systemd thumbnail webengine"

RDEPEND="
	>=app-crypt/keysmith-${GEAR_MIN}
	>=kde-apps/calindori-${GEAR_MIN}:${SLOT}
	>=kde-apps/itinerary-${GEAR_MIN}:${SLOT}
	>=kde-apps/kaccounts-providers-${GEAR_MIN}:${SLOT}
	>=kde-apps/kalk-${GEAR_MIN}:${SLOT}
	>=kde-apps/koko-${GEAR_MIN}:${SLOT}
	>=kde-apps/kongress-${GEAR_MIN}:${SLOT}
	>=kde-apps/ktrip-${GEAR_MIN}:${SLOT}
	>=kde-apps/okular-${GEAR_MIN}:${SLOT}[mobile]
	kde-apps/plasma-phonebook:${SLOT}
	kde-apps/vakzination:${SLOT}
	kde-apps/plasma-camera
	>=kde-apps/qmlkonsole-${GEAR_MIN}:${SLOT}
	>=kde-misc/kclock-${GEAR_MIN}
	>=kde-misc/kdeconnect-${GEAR_MIN}:${SLOT}
	>=kde-misc/kweather-${GEAR_MIN}:${SLOT}
	kde-misc/plymouth-shim
	>=kde-plasma/discover-${PV}:${SLOT}
	>=kde-plasma/kscreen-${PV}:${SLOT}
	>=kde-plasma/kwayland-integration-${PV}:${SLOT}
	>=kde-plasma/oxygen-${PV}:${SLOT}
	>=kde-plasma/oxygen-sounds-${PV}:${SLOT}
	>=kde-plasma/plasma-mobile-${PV}:${SLOT}
	kde-plasma/plasma-mobile-sounds
	kde-plasma/plasma-settings:${SLOT}
	>=kde-plasma/powerdevil-${PV}:${SLOT}
	media-gfx/megapixels
	>=media-sound/audiotube-${GEAR_MIN}:${SLOT}
	>=media-sound/kasts-${GEAR_MIN}
	>=media-sound/elisa-${GEAR_MIN}:${SLOT}
	>=media-sound/krecorder-${GEAR_MIN}
	>=media-video/plasmatube-${GEAR_MIN}:${SLOT}
	>=media-tv/telly-skout-${GEAR_MIN}:${SLOT}
	net-im/kaidan
	>=net-im/neochat-${GEAR_MIN}
	>=net-im/tokodon-${GEAR_MIN}
	>=net-news/alligator-${GEAR_MIN}
	>=www-client/angelfish-${GEAR_MIN}:${SLOT}
	x11-apps/maliit-keyboard
	x11-misc/sddm
	accessibility? ( >=app-accessibility/kontrast-${GEAR_MIN}:${SLOT} )
	bluetooth? ( >=kde-plasma/bluedevil-${PV}:${SLOT} )
	desktop-portal? ( >=kde-plasma/xdg-desktop-portal-kde-${PV}:${SLOT} )
	dialer? ( >=kde-apps/plasma-dialer-${PV}:${SLOT} )
	education? ( webengine? ( >=kde-apps/kalgebra-${GEAR_MIN}:${SLOT} ) )
	games? ( games-kids/gcompris )
	gtk? ( >=kde-plasma/breeze-gtk-${PV}:${SLOT} )
	handbook? ( >=kde-apps/khelpcenter-${PV}:${SLOT} )
	haptic? ( app-mobilephone/hfd-service )
	kwallet? ( >=kde-plasma/kwallet-pam-${PV}:${SLOT} )
	pulseaudio? ( >=kde-plasma/plasma-pa-${PV}:${SLOT} )
	sms? ( app-mobilephone/spacebar:${SLOT} )
	systemd? ( media-gfx/bootsplash-systemd )
	thumbnail? (
		>=kde-apps/ffmpegthumbs-${PV}:${SLOT}
		>=kde-apps/thumbnailers-${PV}:${SLOT}
	)
"

pkg_postinst() {
	optfeature "additional convergent applications from the MauiKit suite" maui-apps/maui-meta
}
