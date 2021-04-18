# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.2.0
KFMIN=5.19.0
inherit ecm kde.org

MY_PV="v${PV}"
MY_P="${PN}-v${PV}"

DESCRIPTION="Next-generation IMAP library"
HOMEPAGE="https://invent.kde.org/pim/kimap2"
SRC_URI="https://invent.kde.org/pim/${PN}/-/archive/${MY_PV}/${MY_P}.tar.bz2"

S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/cyrus-sasl
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-apps/kmime-5.1.40:5
"

RDEPEND="${DEPEND}"
