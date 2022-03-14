# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_MAKEFILE_GENERATOR=emake

inherit cmake

DESCRIPTION="Library for parsing, formatting, and validating international phone numbers"
HOMEPAGE="https://github.com/google/libphonenumber"
SRC_URI="https://github.com/google/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~arm64"
IUSE="geolocation"

RDEPEND="
	dev-cpp/gtest
	dev-libs/boost
	dev-libs/icu
	dev-libs/protobuf:="

DEPEND="${RDEPEND}"

# absil requires downloading the sources from GitHub at build time,
# which is a sandbox violation and dangerous, so we are removing it for now
PATCHES=( "${FILESDIR}/8.12.41-remove-absl.patch" )

CMAKE_USE_DIR="${S}/cpp"

src_configure() {
	local mycmakeargs=(
		-DBUILD_GEOCODER:BOOL=$(use geolocation && echo ON || echo OFF)
	)

	cmake_src_configure
}
