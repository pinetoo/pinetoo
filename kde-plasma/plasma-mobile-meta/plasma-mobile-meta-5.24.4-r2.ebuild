# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_MIN=21.12

DESCRIPTION="Meta package for a complete Plasma Mobile environment for smartphones"
HOMEPAGE="https://www.plasma-mobile.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="accessibility +bluetooth +desktop-portal +dialer education games +gtk handbook kwallet +pulseaudio +sms systemd webengine"

RDEPEND="
	>=kde-apps/alligator-${KDE_MIN}:${SLOT}
	>=kde-apps/angelfish-${KDE_MIN}:${SLOT}
	>=kde-apps/calindori-${KDE_MIN}:${SLOT}
	>=kde-apps/itinerary-${KDE_MIN}:${SLOT}
	>=kde-apps/kaccounts-providers-${KDE_MIN}:${SLOT}
	>=kde-apps/kalk-${KDE_MIN}:${SLOT}
	>=kde-apps/kasts-${KDE_MIN}:${SLOT}
	>=kde-apps/kclock-${KDE_MIN}:${SLOT}
	>=kde-apps/keysmith-${KDE_MIN}:${SLOT}
	>=kde-apps/koko-${KDE_MIN}:${SLOT}
	>=kde-apps/kongress-${KDE_MIN}:${SLOT}
	>=kde-apps/ktrip-${KDE_MIN}:${SLOT}
	>=kde-apps/kweather-${KDE_MIN}:${SLOT}
	>=kde-apps/okular-${KDE_MIN}:${SLOT}
	>=kde-apps/plasma-phonebook-${KDE_MIN}:${SLOT}
	>=kde-apps/tokodon-${KDE_MIN}:${SLOT}
	>=kde-apps/vakzination-${KDE_MIN}:${SLOT}
	kde-apps/plasma-camera
	>=kde-apps/qmlkonsole-${KDE_MIN}:${SLOT}
	>=kde-plasma/discover-${PV}:${SLOT}
	>=kde-plasma/kscreen-${PV}:${SLOT}
	>=kde-plasma/kwayland-integration-${PV}:${SLOT}
	>=kde-plasma/plasma-mobile-${PV}:${SLOT}
	kde-plasma/plasma-mobile-sounds
	>=kde-plasma/plasma-settings-${KDE_MIN}:${SLOT}
	>=kde-plasma/powerdevil-${PV}:${SLOT}
	>=kde-misc/kdeconnect-${KDE_MIN}:${SLOT}
	kde-misc/plymouth-shim
	mail-client/kube
	maui-apps/buho
	maui-apps/clip
	maui-apps/communicator
	maui-apps/index
	maui-apps/nota
	maui-apps/pix
	maui-apps/shelf
	maui-apps/station
	media-gfx/megapixels
	>=media-sound/audiotube-${KDE_MIN}:${SLOT}
	>=media-sound/elisa-${KDE_MIN}:${SLOT}
	>=media-sound/krecorder-${KDE_MIN}:${SLOT}
	>=media-video/plasmatube-${KDE_MIN}:${SLOT}
	media-sound/vvave
	net-im/kaidan
	net-im/neochat
	x11-apps/maliit-keyboard
	x11-misc/sddm
	accessibility? ( >=app-accessibility/kontrast-${KDE_MIN}:${SLOT} )
	bluetooth? ( >=kde-plasma/bluedevil-${PV}:${SLOT} )
	desktop-portal? ( >=kde-plasma/xdg-desktop-portal-kde-${PV}:${SLOT} )
	dialer? ( >=kde-apps/plasma-dialer-${PV}:${SLOT} )
	education? ( webengine? ( >=kde-apps/kalgebra-${KDE_MIN}:${SLOT} ) )
	games? ( games-kids/gcompris )
	gtk? ( >=kde-plasma/breeze-gtk-${PV}:${SLOT} )
	handbook? ( >=kde-apps/khelpcenter-${PV}:${SLOT} )
	kwallet? ( >=kde-plasma/kwallet-pam-${PV}:${SLOT} )
	pulseaudio? ( >=kde-plasma/plasma-pa-${PV}:${SLOT} )
	sms? ( >=app-mobilephone/spacebar-${KDE_MIN}:${SLOT} )
	systemd? ( media-gfx/bootsplash-systemd )
"
