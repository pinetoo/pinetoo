# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.6.0
KFMIN=5.240.0
inherit ecm gear.kde.org

DESCRIPTION="Handling of digital vaccination, test and recovery certificates"
HOMEPAGE="https://invent.kde.org/pim/khealthcertificate"

LICENSE="LGPL-2+"
SLOT="6"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/openssl
	>=dev-qt/qtbase-${QTMIN}:${SLOT}[network]
	>=dev-qt/qtdeclarative-${QTMIN}:${SLOT}
	>=kde-frameworks/karchive-${KFMIN}:${SLOT}
	>=kde-frameworks/kcodecs-${KFMIN}:${SLOT}
	>=kde-frameworks/ki18n-${KFMIN}:${SLOT}
	sys-libs/zlib
	!dev-libs/khealthcertificate:5
"

RDEPEND="${DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:${SLOT}
	>=kde-frameworks/prison-${KFMIN}:${SLOT}
"
