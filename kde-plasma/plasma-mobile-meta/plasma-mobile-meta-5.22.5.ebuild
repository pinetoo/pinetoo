# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_MIN=21.08

DESCRIPTION="Meta package for a complete Plasma Mobile environment for smartphones"
HOMEPAGE="https://www.plasma-mobile.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="+bluetooth +dialer +gtk handbook kwallet +pulseaudio systemd"

RDEPEND="
	>=app-mobilephone/spacebar-${KDE_MIN}:${SLOT}
	>=kde-apps/angelfish-${KDE_MIN}:${SLOT}
	>=kde-apps/calindori-${KDE_MIN}:${SLOT}
	>=kde-apps/kalk-${KDE_MIN}:${SLOT}
	>=kde-apps/kclock-${KDE_MIN}:${SLOT}
	>=kde-apps/keysmith-${KDE_MIN}:${SLOT}
	>=kde-apps/koko-${KDE_MIN}:${SLOT}
	>=kde-apps/kongress-${KDE_MIN}:${SLOT}
	>=kde-apps/ktrip-${KDE_MIN}:${SLOT}
	>=kde-apps/kweather-${KDE_MIN}:${SLOT}
	>=kde-apps/okular-${KDE_MIN}:${SLOT}
	>=kde-apps/plasma-phonebook-${KDE_MIN}:${SLOT}
	>=kde-apps/qmlkonsole-${KDE_MIN}:${SLOT}
	>=kde-plasma/discover-${PV}:${SLOT}
	>=kde-plasma/plasma-phone-components-${PV}:${SLOT}
	>=kde-plasma/plasma-settings-${KDE_MIN}:${SLOT}
	>=kde-plasma/powerdevil-${PV}:${SLOT}
	>=kde-misc/kdeconnect-${KDE_MIN}:${SLOT}
	kde-misc/plymouth-shim
	mail-client/kube
	maui-apps/buho
	maui-apps/index
	maui-apps/nota
	maui-apps/station
	media-gfx/megapixels
	>=media-sound/krecorder-${KDE_MIN}:${SLOT}
	media-sound/vvave
	net-im/neochat
	x11-apps/maliit-keyboard
	x11-misc/sddm
	bluetooth? ( >=kde-plasma/bluedevil-${PV}:${SLOT} )
	dialer? ( >=kde-apps/plasma-dialer-${PV}:${SLOT} )
	gtk? ( >=kde-plasma/breeze-gtk-${PV}:${SLOT} )
	handbook? ( >=kde-apps/khelpcenter-${PV}:${SLOT} )
	kwallet? ( >=kde-plasma/kwallet-pam-${PV}:${SLOT} )
	pulseaudio? ( >=kde-plasma/plasma-pa-${PV}:${SLOT} )
	systemd? ( media-gfx/bootsplash-systemd )
"
