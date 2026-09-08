# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://invent.kde.org/jbbgameich/ktactilefeedback.git"
EGIT_COMMIT="da7858aaa125588d4c309f273afefff93222e8f9"

QTMIN=6.4.0

inherit git-r3 ecm

DESCRIPTION="KDE Tactile Feedback library"
HOMEPAGE="https://invent.kde.org/jbbgameich/ktactilefeedback"

LICENSE="|| ( LGPL-3 GPL-3 GPL-2 )"
SLOT="6"
KEYWORDS="~arm64"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,network,ssl]
	>=dev-qt/qtmultimedia-${QTMIN}:6
"
RDEPEND="${DEPEND}
	dev-libs/feedbackd
"
