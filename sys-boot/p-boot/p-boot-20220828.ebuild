# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://megous.com/git/p-boot"
EGIT_COMMIT="362d3eccc3efaa8b3bb6587b593fc0331a0dcbb3"

TFVER="2.9"

inherit git-r3 ninja-utils

DESCRIPTION="Pico-sized bootloader for PinePhone"
HOMEPAGE="https://xnux.eu/p-boot/"
SRC_URI="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/snapshot/trusted-firmware-a-${TFVER}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
RESTRICT="strip"
IUSE="debug"

RDEPEND="!sys-boot/p-boot-bin"

DEPEND="sys-firmware/crust:="

BDEPEND="dev-lang/php[cli]"

S=${WORKDIR}

pkg_pretend() {
	if ! has_version cross-arm-none-eabi/gcc && [[ ${MERGE_TYPE} != binary ]]; then
		eerror "cross-arm-none-eabi/gcc is required to build this package."
		eerror "To install it:"
		eerror "	emerge --ask sys-devel/crossdev"
		eerror "	crossdev --stable --target arm-none-eabi"
		die
	fi
}

src_unpack() {
	default
	git-r3_src_unpack
}

src_prepare() {
	cd "trusted-firmware-a-${TFVER}" || die
	eapply ../${P}/fw/atf-patches/*.patch
	default
}

src_configure() {
	cd "${P}" || die
	echo "aarch64_prefix = ${CHOST}-" >> config.ini && php configure.php || die
}

src_compile() {
	cd "trusted-firmware-a-${TFVER}" || die
	unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
	emake PLAT=sun50i_a64 bl31 SUNXI_PBOOT=1 SUNXI_SETUP_REGULATORS=1 SUNXI_AMEND_DTB=1 LOG_LEVEL=$(usex debug LOG_LEVEL_NOTICE LOG_LEVEL_ERROR)
	cp build/sun50i_a64/release/bl31.bin fw.bin || die
	dd if=${ESYSROOT}/usr/share/crust/scp.bin of=fw.bin bs=1k seek=48 || die
	cd "../${P}" || die
	eninja
}

src_install() {
	cd "${P}" || die
	dodoc README
	cd dist || die
	dobin "${PN}-conf"
	insinto "/usr/share/${PN}"
	doins "${PN}.bin" "${PN}-serial.bin" "../../trusted-firmware-a-${TFVER}/fw.bin"
	cd ../example/files || die
	doins *.argb
	cd .. || die
	docinto examples
	dodoc boot.conf.sh "${PN}-install.sh" "${PN}-reconf.sh"

	# p-boot-conf will always look for a files subdirectory even if no file is needed there
	keepdir "/etc/${PN}/files"

	cat > "${ED}/etc/${PN}/boot.conf.sample" <<-EOF || die
	no          = 0
	  name      = Pinetoo Linux
	  atf       = ../../usr/share/p-boot/fw.bin
	  dtb       = ../../boot/dtbs/$(uname -r)/allwinner/sun50i-a64-pinephone-$(sed -e 's/.*(//' -e 's/).*//' /proc/device-tree/model).dtb
	  linux     = ../../boot/vmlinux-$(uname -r)
	  bootargs  = $(cat /proc/cmdline)
	  splash    = ../../usr/share/p-boot/pboot2.argb
	EOF
}

pkg_postinst() {
	einfo "Check the README file at /usr/share/doc/${P} for instructions on Installing p-boot to the \"boot sector\""
}
