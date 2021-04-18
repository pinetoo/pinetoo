# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://invent.kde.org/pim/kpeoplesink.git"
QTMIN=5.12.0
KFMIN=5.60.0

inherit ecm git-r3 kde.org

DESCRIPTION="Expose Sink contacts to KPeople"
HOMEPAGE="https://invent.kde.org/pim/kpeoplesink"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	sys-devel/gettext
	dev-libs/kasync
	dev-libs/sink
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kpeople-${KFMIN}:5
	>=kde-frameworks/kcontacts-${KFMIN}:5
	>=kde-apps/kaccounts-integration-${KFMIN}:5
"

DEPEND="${DEPEND}"
