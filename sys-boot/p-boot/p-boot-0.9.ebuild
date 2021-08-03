# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://megous.com/git/p-boot"
EGIT_COMMIT="0.9"

inherit git-r3 ninja-utils

DESCRIPTION="Pico-sized bootloader for PinePhone"
HOMEPAGE="https://xnux.eu/p-boot/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
RESTRICT="strip"

BDEPEND="dev-lang/php[cli]"

src_configure() {
	echo "aarch64_prefix =" > config.ini &&	php configure.php || die
}

src_compile() {
	eninja
}

src_install() {
	dodoc README
	cd dist || die
	dobin "${PN}-conf"
	insinto "/usr/share/${PN}"
	doins "${PN}.bin" "${PN}-serial.bin" fw.bin fw-debug.bin
	cd ../example/files || die
	doins *.argb
	cd ..
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
