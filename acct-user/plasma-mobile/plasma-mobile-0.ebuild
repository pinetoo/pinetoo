# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

KEYWORDS="~arm64"
DESCRIPTION="Default user for Plasma Mobile auto-login"

ACCT_USER_GROUPS=( "plasma-mobile" "wheel" "audio" "input" "video" )
ACCT_USER_ID="-1"
ACCT_USER_HOME="/home/${PN}"
ACCT_USER_HOME_PERMS="700"
ACCT_USER_SHELL="/bin/sh"

acct-user_add_deps
