# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_OVERRIDE_REPO_KDE_KQUICKSYNTAXHIGHLIGHTER="https://invent.kde.org/hein/${PN}.git"
QTMIN=5.6.0
KFMIN=5.40.0

inherit ecm git-r3 kde.org

DESCRIPTION="Syntax highlighter for KQuick"
HOMEPAGE="https://invent.kde.org/hein/kquicksyntaxhighlighter"

LICENSE="BSD CC0-1.0 MIT"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=kde-frameworks/syntax-highlighting-${KFMIN}:5
"

RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
"
