# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 mount-boot systemd

MY_PN="${PN/-/}-pinephonepro"
EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/core/${MY_PN}.git"
EGIT_COMMIT="6dd056d0db54bfd7e9f6a375c8564ef7a1694172"
TFVER="2.7"

DESCRIPTION="U-Boot for Pine64 PinePhone Pro"
HOMEPAGE="https://www.denx.de/project/u-boot/"
SRC_URI="ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

BDEPEND="sys-firmware/trusted-firmware-a"

RDEPEND="${DEPEND}
	dev-embedded/u-boot-tools"

PATCHES=(
	"${S}/1001-Correct-boot-order-to-be-USB-SD-eMMC.patch"
	"${S}/1002-rockchip-Add-initial-support-for-the-PinePhone-Pro.patch"
	"${S}/1004-mtd-spi-nor-ids-Add-GigaDevice-GD25LQ128E-entry.patch"
	"${S}/1005-Reconfigure-GPIO4_D3-as-input-on-PinePhone-Pro.patch"
	"${S}/2001-mmc-sdhci-allow-disabling-sdma-in-spl.patch"
	"${S}/2002-ram-rk3399-Fix-.set_rate_index-error-handling.patch"
	"${S}/2003-ram-rk3399-Fix-faulty-frequency-change-reports.patch"
	"${S}/2004-ram-rk3399-Conduct-memory-training-at-400MHz.patch"
	"${S}/3001-pinephone-pro-Remove-cargo-culted-iodomain-config.patch"
	"${S}/3002-pine64-pinephonePro-SPI-support.patch"
)

src_unpack() {
	default
	git-r3_src_unpack
}

src_configure() {
	emake pinephone-pro-rk3399_defconfig

	cat <<-EOF > "${T}"/extra.config || die
	CONFIG_IDENT_STRING=" Pinetoo Linux"
	CONFIG_BOOTDELAY=0
	CONFIG_SPL_DM_SEQ_ALIAS=y
	CONFIG_SF_DEFAULT_BUS=1
	CONFIG_SPL_MMC_SDHCI_SDMA=n
	EOF

	./scripts/kconfig/merge_config.sh -m -r .config "${T}"/extra.config
}

src_compile() {
	emake BL31=/usr/share/trusted-firmware/bl31.elf
}

src_install() {
	insinto /boot
	doins idbloader.img u-boot.itb
	newins boot.txt boot.txt.example

	dobin ppp-uboot-mkscr ppp-prepare-fstab ppp-uboot-flash

	systemd_dounit ppp-prepare-fstab.service
}
