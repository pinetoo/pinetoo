# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Meta package for a complete Plasma Mobile environment for smartphones"
HOMEPAGE="https://www.plasma-mobile.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="~arm64"
IUSE="+dialer handbook pulseaudio"

RDEPEND="
	kde-plasma/plasma-phone-components
	dialer? ( kde-apps/plasma-dialer )
	handbook? ( kde-apps/khelpcenter )
	pulseaudio? ( kde-plasma/plasma-pa )
"
