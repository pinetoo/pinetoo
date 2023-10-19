# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-3 )

inherit lua-single systemd

DESCRIPTION="Fan speed control tool for RockPro64 single board computers"
HOMEPAGE="https://github.com/tuxd3v/ats"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/tuxd3v/ats.git"
	inherit git-r3
else
	SRC_URI="https://github.com/tuxd3v/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm64"
fi

LICENSE="tuxd3v"
SLOT="0"

REQUIRED_USE="${LUA_REQUIRED_USE}"
DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"

src_prepare()
{
	# Don't modify systemd services directly
	sed -i 's/\(@\)\?\(systemctl\)/\1true #\1\2/' Makefile || die

	# Fix bin path
	sed -i 's-ExecStart=/usr/local/sbin/ats-ExecStart=/usr/bin/ats-' \
		systemd/ats.service || die

	# Fix shebang
	sed -i "s%#! /usr/bin/env lua%#!/usr/bin/env ${ELUA}%" \
		src/ats || die

	default
}

src_install()
{
	dobin src/ats

	exeinto "$(lua_get_cmod_dir)"
	doexe ats.so.0.9
	dosym ats.so.0.9 "$(lua_get_cmod_dir)/ats.so"

	insinto /etc
	doins etc/ats.conf

	systemd_dounit systemd/ats.service
}
