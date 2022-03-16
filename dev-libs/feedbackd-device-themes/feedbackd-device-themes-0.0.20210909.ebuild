# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

MY_P="${PN}-v${PV}"

KEYWORDS="~arm64"

DESCRIPTION="Feedbackd themes for different devices"
HOMEPAGE="https://source.puri.sm/Librem5/feedbackd-device-themes"

SRC_URI="https://source.puri.sm/Librem5/feedbackd-device-themes/-/archive/v${PV}/feedbackd-device-themes-v${PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"

DEPEND="dev-libs/json-glib"
RDEPEND="dev-libs/feedbackd"

S="${WORKDIR}/${MY_P}"
