# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Meta package for convergent MauiKit applications"
HOMEPAGE="https://mauikit.org/apps/"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~arm64"
IUSE="sdk"

RDEPEND="
	maui-apps/agenda
	maui-apps/arca
	maui-apps/booth
	~maui-apps/buho-${PV}
	~maui-apps/clip-${PV}
	~maui-apps/communicator-${PV}
	~maui-apps/index-${PV}
	~maui-apps/nota-${PV}
	~maui-apps/pix-${PV}
	~maui-apps/shelf-${PV}
	~maui-apps/station-${PV}
	~media-sound/vvave-${PV}
	www-client/fiery
	sdk? (
		dev-vcs/bonsai
		dev-util/strike
	)
"
