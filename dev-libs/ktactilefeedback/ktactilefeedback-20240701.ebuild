# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://invent.kde.org/jbbgameich/ktactilefeedback.git"
EGIT_COMMIT="e9fec4b53640464d269cda6cc5ccfa0d54869a00"

KFMIN=6.5.0
QTMIN=6.4.0

inherit git-r3 ecm

DESCRIPTION="KDE Tactile Feedback library"
HOMEPAGE="https://invent.kde.org/jbbgameich/ktactilefeedback"

LICENSE="|| ( LGPL-3 GPL-3 GPL-2 )"
SLOT="6"
KEYWORDS="~arm64"

RDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,network,ssl]
	>=dev-qt/qtmultimedia-${QTMIN}:6
"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/fix_up_headers_deployment.patch" )
