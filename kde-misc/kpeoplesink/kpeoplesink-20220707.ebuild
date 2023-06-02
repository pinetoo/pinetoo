# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://invent.kde.org/pim/kpeoplesink.git"
EGIT_COMMIT="6f382e619e22f9f34b0760fc19a23eb1863bf45b"
QTMIN=5.15.0
KFMIN=5.78.0
inherit ecm git-r3

DESCRIPTION="Reveal sink contacts in KPeople"
HOMEPAGE="https://invent.kde.org/pim/kpeoplesink"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="~arm64"

DEPEND="
	dev-libs/kasync:${SLOT}
	dev-libs/sink:${SLOT}
	>=dev-qt/qtcore-${QTMIN}:${SLOT}
	>=dev-qt/qtnetwork-${QTMIN}:${SLOT}
	>=dev-qt/qtwidgets-${QTMIN}:${SLOT}
	kde-apps/kaccounts-integration
	>=kde-frameworks/kcontacts-${KFMIN}:${SLOT}
	>=kde-frameworks/kcoreaddons-${KFMIN}:${SLOT}
	>=kde-frameworks/kpeople-${KFMIN}:${SLOT}
"

RDEPEND="${DEPEND}"
