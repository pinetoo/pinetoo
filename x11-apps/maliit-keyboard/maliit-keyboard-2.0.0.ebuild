# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2 cmake

DESCRIPTION="Software keyboard for mobile devices"
HOMEPAGE="https://github.com/maliit/keyboard"
SRC_URI="https://github.com/maliit/keyboard/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3 CC-BY-3.0"
SLOT="5"
KEYWORDS="~arm64"
IUSE="cjk spell +suggestions"

DEPEND="
	dev-libs/glib:2
	x11-libs/maliit
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtdbus:5
	dev-qt/qtmultimedia:5
	dev-qt/qtgraphicaleffects:5
	cjk? (
		app-i18n/anthy
		|| (
			app-i18n/libpinyin
			app-i18n/libchewing
		)
	)
	spell? ( app-text/hunspell )
	suggestions? ( app-text/presage )
"

RDEPEND="${DEPEND}
	dev-qt/qtquickcontrols2"

S="${WORKDIR}/keyboard-${PV}"

src_configure() {
	local mycmakeargs=(
		cmake_use_find_package cjk Anthy
		cmake_use_find_package cjk Pinyin
		cmake_use_find_package cjk Chewing
		-Denable-hunspell:BOOL=$(use spell && echo ON || echo OFF)
		-Denable-presage:BOOL=$(use suggestions && echo ON || echo OFF)
	)

	cmake_src_configure
}
