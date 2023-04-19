# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://megous.com/git/p-boot"
EGIT_COMMIT="a571ec66831d90426a6b397943fc6d4021508c7b"

inherit git-r3 ninja-utils

DESCRIPTION="Pico-sized bootloader for PinePhone"
HOMEPAGE="https://xnux.eu/p-boot/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
RESTRICT="strip"

DEPEND="!sys-boot/p-boot"

src_install() {
	dodoc README
	cd dist || die
	dobin p-boot-{,un}conf
	insinto "/usr/share/p-boot"
	doins p-boot.bin "p-boot-serial.bin" fw.bin fw-debug.bin
	cd ../example/files || die
	doins *.argb
	cd ..
	docinto examples
	dodoc boot.conf.sh "p-boot-install.sh" "p-boot-reconf.sh"

	# p-boot-conf will always look for a files subdirectory even if no file is needed there
	keepdir "/etc/p-boot/files"

	cat > "${ED}/etc/p-boot/boot.conf.sample" <<-EOF || die
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
