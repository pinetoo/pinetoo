# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.3.0
QTMIN=6.6.0
inherit ecm gear.kde.org xdg

DESCRIPTION="Tool to browse in local, remote and offline journald databases"
HOMEPAGE="https://apps.kde.org/kjournaldbrowser/"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=dev-qt/qtbase-${QTMIN}:6[widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	sys-apps/systemd
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:6
"
