# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GEAR_MIN=22.04

DESCRIPTION="Meta package for a complete Plasma Mobile environment for smartphones"
HOMEPAGE="https://www.plasma-mobile.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="accessibility +bluetooth +desktop-portal +dialer education games +gtk handbook kwallet +pulseaudio sdk +sms systemd webengine"

RDEPEND="
	>=kde-apps/alligator-${GEAR_MIN}:${SLOT}
	>=kde-apps/angelfish-${GEAR_MIN}:${SLOT}
	>=kde-apps/calindori-${GEAR_MIN}:${SLOT}
	>=kde-apps/itinerary-${GEAR_MIN}:${SLOT}
	>=kde-apps/kaccounts-providers-${GEAR_MIN}:${SLOT}
	>=kde-apps/kalk-${GEAR_MIN}:${SLOT}
	>=kde-apps/kasts-${GEAR_MIN}:${SLOT}
	>=kde-apps/kclock-${GEAR_MIN}:${SLOT}
	>=kde-apps/keysmith-${GEAR_MIN}:${SLOT}
	>=kde-apps/koko-${GEAR_MIN}:${SLOT}
	>=kde-apps/kongress-${GEAR_MIN}:${SLOT}
	>=kde-apps/ktrip-${GEAR_MIN}:${SLOT}
	>=kde-apps/kweather-${GEAR_MIN}:${SLOT}
	>=kde-apps/okular-${GEAR_MIN}:${SLOT}
	>=kde-apps/plasma-phonebook-${GEAR_MIN}:${SLOT}
	>=kde-apps/tokodon-${GEAR_MIN}:${SLOT}
	>=kde-apps/vakzination-${GEAR_MIN}:${SLOT}
	kde-apps/plasma-camera
	>=kde-apps/qmlkonsole-${GEAR_MIN}:${SLOT}
	>=kde-plasma/discover-${PV}:${SLOT}
	>=kde-plasma/kscreen-${PV}:${SLOT}
	>=kde-plasma/kwayland-integration-${PV}:${SLOT}
	>=kde-plasma/oxygen-${PV}:${SLOT}
	>=kde-plasma/plasma-mobile-${PV}:${SLOT}
	kde-plasma/plasma-mobile-sounds
	>=kde-plasma/plasma-settings-${GEAR_MIN}:${SLOT}
	>=kde-plasma/powerdevil-${PV}:${SLOT}
	>=kde-misc/kdeconnect-${GEAR_MIN}:${SLOT}
	kde-misc/plymouth-shim
	mail-client/kube
	maui-apps/booth
	maui-apps/buho
	maui-apps/clip
	maui-apps/communicator
	maui-apps/index
	maui-apps/nota
	maui-apps/pix
	maui-apps/shelf
	maui-apps/sol
	maui-apps/station
	media-gfx/megapixels
	>=media-sound/audiotube-${GEAR_MIN}:${SLOT}
	>=media-sound/elisa-${GEAR_MIN}:${SLOT}
	>=media-sound/krecorder-${GEAR_MIN}:${SLOT}
	>=media-video/plasmatube-${GEAR_MIN}:${SLOT}
	media-sound/vvave
	net-im/kaidan
	net-im/neochat
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
	kwallet? ( >=kde-plasma/kwallet-pam-${PV}:${SLOT} )
	pulseaudio? ( >=kde-plasma/plasma-pa-${PV}:${SLOT} )
	sdk? (
		maui-apps/bonsai
		maui-apps/strike
	)
	sms? ( >=app-mobilephone/spacebar-${GEAR_MIN}:${SLOT} )
	systemd? ( media-gfx/bootsplash-systemd )
"
