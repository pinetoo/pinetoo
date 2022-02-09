# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.15.0
KFMIN=5.85.0
KDE_GEAR=true
inherit ecm kde.org

DESCRIPTION="Handling of digital vaccination, test and recovery certificates"
HOMEPAGE="https://invent.kde.org/pim/khealthcertificate"
SRC_URI="mirror://kde/stable/plasma-mobile/${PV}/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/openssl
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=kde-frameworks/karchive-${KFMIN}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	sys-libs/zlib
"

RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/prison-${KFMIN}:5
"
