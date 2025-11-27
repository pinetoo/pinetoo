# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Meta package for convergent MauiKit applications"
HOMEPAGE="https://mauikit.org/apps/"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~arm64"
IUSE="experimental sdk"

RDEPEND="
	~maui-apps/buho-${PV}
	~maui-apps/clip-${PV}
	~maui-apps/communicator-${PV}
	~maui-apps/index-${PV}
	~maui-apps/nota-${PV}
	~maui-apps/pix-${PV}
	~maui-apps/shelf-${PV}
	~maui-apps/station-${PV}
	~media-sound/vvave-${PV}
	experimental? (
		~maui-apps/agenda-1.0.2
		~maui-apps/arca-1.0.1
		~www-client/fiery-2.0.1
		sdk? (
			~dev-util/strike-2.0.1
		)
	)
"
