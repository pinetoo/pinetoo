# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils multilib systemd

DESCRIPTION="Open Source mobile telephony (GSM/UMTS) daemon"
HOMEPAGE="https://01.org/ofono"
SRC_URI="https://www.kernel.org/pub/linux/network/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+atmodem bluetooth +cdmamodem +datafiles doc dundee examples +isimodem +phonesim +provision +qmimodem tools +udev upower"

REQUIRED_USE="dundee? ( bluetooth )"

RDEPEND=">=sys-apps/dbus-1.4
	>=dev-libs/glib-2.32
	net-misc/mobile-broadband-provider-info
	bluetooth? ( >=net-wireless/bluez-4.99 )
	udev? ( virtual/udev )
	examples? ( dev-python/dbus-python )
	tools? ( virtual/libusb:1 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( ChangeLog AUTHORS )

PATCHES=(
	"${FILESDIR}/0001-common-create-GList-helper-ofono_call_compare.patch"
	"${FILESDIR}/0002-common-atmodem-move-at_util_call_compare_by_status-t.patch"
	"${FILESDIR}/0003-common-atmodem-move-at_util_call_compare_by_id-to-dr.patch"
	"${FILESDIR}/0004-add-call-list-helper-to-manage-voice-call-lists.patch"
	"${FILESDIR}/0005-qmimodem-implement-voice-calls.patch"
	"${FILESDIR}/fix-explicit-bzero.patch"
	"${FILESDIR}/fix-TEMP_FAILURE_RETRY.patch"
	"${FILESDIR}/skip-broken-test.patch"
	"${FILESDIR}/support-smdpkt.patch"
	"${FILESDIR}/0001-doc-ofonod.8-escape-minus-sign.patch"
	"${FILESDIR}/0002-Remove-After-syslog.target-from-systemd-.service-fil.patch"
	"${FILESDIR}/qmimodem-correct-state-for-incoming-call.patch"
	"${FILESDIR}/sim-change-notification-for-pin-valies.patch"
	"${FILESDIR}/0001-gprs-Add-Preferred-property-to-contexts.patch"
	"${FILESDIR}/0002-qmimodem-Implement-data-capability-bearer-notify.patch"
	"${FILESDIR}/0003-qmimodem-Allow-UMTS-and-LTE-to-fallback-to-a-lower-c.patch"
	"${FILESDIR}/0004-qmimodem-HACK-use-fast-dormancy-calls-to-quarry-stat.patch"
	"${FILESDIR}/0005-qmimodem-Fix-dialing-to-an-international-number.patch"
	"${FILESDIR}/0006-qmimodem-implement-dtmf.patch"
	"${FILESDIR}/0007-qmimodem_Add_USSD_indication_support.patch"
	"${FILESDIR}/0001-voicecall-do-not-force-the-voice-type.patch"
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable udev) \
		$(use_enable isimodem) \
		$(use_enable atmodem) \
		$(use_enable cdmamodem) \
		$(use_enable datafiles) \
		$(use_enable dundee) \
		$(use_enable bluetooth) \
		$(use_enable phonesim) \
		$(use_enable provision) \
		$(use_enable qmimodem) \
		$(use_enable tools) \
		$(use_enable examples test) \
		$(use_enable upower) \
		--disable-bluez4 \
		--disable-maintainer-mode \
		--disable-rilmodem
		--localstatedir=/var \
		--with-systemdunitdir="$(systemd_get_systemunitdir)"
}

src_install() {
	default

	if use tools ; then
		dobin tools/auto-enable \
			tools/huawei-audio \
			tools/lookup-provider-name \
			tools/lookup-apn \
			tools/get-location \
			tools/tty-redirector
	fi

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	use doc && dodoc doc/*.txt
}
