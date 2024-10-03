# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.0
KFMIN=5.240
inherit ecm gear.kde.org

DESCRIPTION="Handling of digital vaccination, test and recovery certificates"
HOMEPAGE="https://invent.kde.org/pim/khealthcertificate"

LICENSE="LGPL-2+"
SLOT="6"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/openssl
	>=dev-qt/qtbase-${QTMIN}:6[network]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/karchive-${KFMIN}:6
	>=kde-frameworks/kcodecs-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	sys-libs/zlib
	!dev-libs/khealthcertificate:5
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/prison-${KFMIN}:6
"
