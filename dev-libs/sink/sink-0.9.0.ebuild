# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ecm

MY_PV="v${PV}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Data access layer handling synchronization, caching and indexing"
HOMEPAGE="https://invent.kde.org/pim/sink"
SRC_URI="https://invent.kde.org/pim/${PN}/-/archive/${MY_PV}/${MY_P}.tar.bz2"

LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="~arm64"

RDEPEND="
	app-crypt/gpgme
	dev-db/lmdb:=
	>=dev-libs/flatbuffers-1.4.0
	>=dev-libs/kasync-0.3:5
	>=dev-libs/xapian-1.4.4:0=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtconcurrent:5
	kde-apps/kmime:5
	kde-frameworks/kcalendarcore:5
	kde-frameworks/kcontacts:5
	kde-frameworks/kcoreaddons:5
	kde-frameworks/kcodecs:5
	>=net-libs/kimap2-0.4:5
	>=net-misc/curl-7.20.0
	sys-libs/readline:0=
	>=net-libs/kdav2-0.3
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

RESTRICT+=" test"

src_prepare() {
	default
	cmake_src_prepare
	find -name CMakeLists.txt | xargs sed -i "s/add_subdirectory(tests)//" || die
}
