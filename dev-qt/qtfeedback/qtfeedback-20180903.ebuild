# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/qt/qtfeedback.git"
EGIT_BRANCH="master"
EGIT_COMMIT="a14bd0bb1373cde86e09e3619fb9dc70f34c71f2"

inherit git-r3 qmake-utils

DESCRIPTION="Qt Tactile Feedback"
HOMEPAGE="https://github.com/qt/qtfeedback"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="
	dev-qt/qtcore:${SLOT}
	dev-qt/qtdeclarative:${SLOT}
	dev-qt/qtmultimedia:${SLOT}
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/5.0.0_beta1-define-version.patch"
	"${FILESDIR}/plugin_class_name.patch"
)

src_configure() {
	eqmake5 "${PN}.pro" INCPATH="${S}/src/feedback"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
