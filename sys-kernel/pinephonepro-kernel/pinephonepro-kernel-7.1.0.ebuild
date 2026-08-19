# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://gitlab.postmarketos.org/postmarketOS/pmaports.git"
EGIT_COMMIT="bbd72c2711620a6044823f4eecfb6886ee51d6d8"

inherit git-r3 kernel-build

DESCRIPTION="Linux kernel for the PinePhone"
HOMEPAGE=""
SRC_URI="https://github.com/torvalds/linux/archive/refs/tags/v$(ver_cut 1).$(ver_cut 2).tar.gz -> linux-$(ver_cut 1).$(ver_cut 2).tar.gz"
S="${WORKDIR}/linux-$(ver_cut 1).$(ver_cut 2)"

LICENSE="GPL-2"
KEYWORDS="~arm64"
IUSE="debug"

GIT_ROOT="device/community/linux-pine64-pinephonepro"

PATCHES=(
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0001-ASoC-codecs-rt5640-Fix-output-mixer-input-channel-li.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0002-ASoC-codecs-rt5640-Fix-hpout-restore-when-lout-is-en.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0003-ASoC-codecs-rt5640-Add-input-mixer-input-volume-cont.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0004-ASoC-codecs-rt5640-Allow-to-control-single-ended-dif.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0005-ASoC-codecs-rt5640-Keep-the-codec-enabled-when-idle.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0006-ASoC-codecs-rt5640-Add-support-for-power-supplies.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0007-media-imx258-Add-i2c-supply.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0008-media-imx258-Add-reset-gpio.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0009-media-imx258-Drop-interface-speed-to-1224-mbps.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0010-DEBUG-media-imx258-Add-debug-register-access.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0011-ASoC-rockchip-Fix-doubling-of-playback-speed-after-s.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0012-Revert-usb-dwc3-Abort-suspend-on-soft-disconnect-fai.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0013-thermal-rockchip-Add-support-for-RV1106-SoC.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0014-soc-rockchip-Add-support-for-power-monitoring-driver.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0015-rtc-rockchip-Add-support-for-RTC-present-in-RV1106-S.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0016-thermal-rockchip-Add-support-for-RK3506.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0017-mtd-spi-nor-gigadevice-Add-support-for-gd25lq128e.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0018-clk-rk3399-Export-SCLK_CIF_OUT_SRC-to-device-tree.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0019-clk-rockchip-rk3399-Don-t-allow-to-reparent-dclk_vop.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0020-power-supply-Add-support-for-USB_BC_ENABLED-and-USB_.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0021-mfd-rk8xx-Enable-rk808-clkout2-function.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0022-power-supply-rk818_battery-Add-battery-charger-drive.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0023-power-supply-rk818_battery-Add-code-docs-for-the-HW-.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0024-Revert-usb-typec-tcpm-unregister-existing-source-cap.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0025-usb-typec-altmodes-displayport-Respect-DP_CAP_RECEPT.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0026-usb-typec-tcpm-Unregister-altmodes-before-registerin.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0027-usb-typec-tcpm-Fix-PD-devices-capabilities-registrat.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0028-usb-typec-fusb302-Slightly-increase-wait-time-for-BC.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0029-usb-typec-fusb302-Set-the-current-before-enabling-pu.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0030-usb-typec-fusb302-Retry-reading-of-CC-pins-status-if.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0031-usb-typec-fusb302-Update-VBUS-state-even-if-VBUS-int.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0032-usb-typec-fusb302-Add-OF-extcon-support.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0033-usb-typec-fusb302-Fix-register-definitions.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0034-usb-typec-fusb302-Clear-interrupts-before-we-start-t.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0035-usb-typec-fusb302-Turn-off-VBUS-and-VCONN-on-shutdow.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0036-phy-rockchip-inno-usb2-Add-support-for-RV1106-RV1103.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0037-phy-rockchip-inno-usb2-Add-support-for-RK3506.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0038-phy-rockchip-inno-usb2-Add-PHY-tuning-for-rk3566-rk3.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0039-drm-rockchip-cdn-dp-Disable-CDN-DP-on-disconnect.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0040-phy-rockchip-inno-usb2-Decrease-delay-between-port-i.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0041-phy-rockchip-inno-usb2-More-robust-charger-detection.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0042-usb-dwc3-Track-the-power-state-of-usb3_generic_phy.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0043-usb-dwc3-Always-disable-SUSPHY-when-entering-a-role.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0044-usb-dwc3-Track-cable-connection-state-separately-fro.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0045-usb-dwc3-Power-cycle-USB3-PHY-on-role-connection-cha.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0046-usb-dwc3-Register-the-role-even-when-no-cable-is-con.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0047-phy-rockchip-inno-usb2-Set-up-charger-detection-mode.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0048-usb-dwc3-Do-not-re-register-the-gadget-on-cable-even.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0049-phy-rockchip-typec-Support-a-Type-C-orientation-swit.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0050-phy-rockchip-typec-Support-a-Type-C-mode-mux.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0051-phy-rockchip-typec-Publish-the-DP-lane-count.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0052-drm-rockchip-cdn-dp-Support-ports-driven-by-a-Type-C.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0053-phy-rockchip-inno-usb2-Learn-the-host-role-from-phy_.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0054-usb-dwc3-Tell-the-UDC-core-when-there-is-no-cable.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0055-phy-rockchip-inno-usb2-Do-not-run-charger-detection-.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0056-usb-dwc3-Set-the-PHY-mode-before-starting-the-host.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0057-usb-dwc3-Do-not-connect-the-gadget-while-no-cable-is.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0058-phy-rockchip-inno-usb2-Power-the-PHY-up-before-the-h.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0059-usb-dwc3-Require-MPS-aligned-OUT-buffers.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0060-usb-typec-displayport-Update-the-mux-before-signalli.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0061-arm64-dts-rockchip-rk3399-Disable-debug-nodes.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0062-arm64-dts-rockchip-rk3399-Add-reboot-mode-driver.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0063-arm64-dts-rockchip-rk3399-Power-cycle-the-USB3-PHY-o.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0064-arm64-dts-rockchip-rk3399-Add-dmc_opp_table.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0065-arm64-dts-rockchip-rk3399-s-Add-DMC-table.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0066-arm64-dts-rockchip-rk3399-Number-the-CDN-DP-ports.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0067-arm64-dts-rockchip-rk3399-pinephone-pro-Add-Type-C-p.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0068-arm64-dts-rockchip-rk3399-pinephone-pro-Add-internal.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0069-arm64-dts-rockchip-rk3399-pinephone-pro-Add-battery-.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0070-arm64-dts-rockchip-rk3399-pinephone-pro-Add-sound-su.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0071-arm64-dts-rockchip-rk3399-pinephone-pro-Add-modem-su.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0072-arm64-dts-rockchip-rk3399-pinephone-pro-Change-modem.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0073-arm64-dts-rockchip-rk3399-pinephone-pro-Add-light-pr.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0074-arm64-dts-rockchip-rk3399-pinephone-pro-Add-I2C-supp.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0075-arm64-dts-rockchip-rk3399-pinephone-pro-Add-magnetom.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0076-arm64-dts-rockchip-rk3399-pinephone-pro-Add-mount-ma.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0077-arm64-dts-rockchip-rk3399-pinephone-pro-Enable-POGO-.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0078-arm64-dts-rockchip-rk3399-pinephone-pro-Add-pinephon.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0079-arm64-dts-rockchip-rk3399-pinephone-pro-Switch-LED-b.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0080-arm64-dts-rockchip-rk3399-pinephone-pro-Pre-configur.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0081-arm64-dts-rockchip-rk3399-pinephone-pro-Improve-SPI-.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0082-arm64-dts-rockchip-rk3399-pinephone-pro-Assign-power.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0083-arm64-dts-rockchip-rk3399-pinephone-pro-Add-camera-f.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/megi_patches/0084-arm64-dts-rockchip-rk3399-pinephone-pro-Disable-inte.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/0001-arm64-dts-rk3399-pinephone-pro-Keep-modem-regulators.patch"
	"${WORKDIR}/${P}/${GIT_ROOT}/BTF-seg-fault.patch"
)

src_unpack() {
	default
	git-r3_src_unpack
}

src_prepare() {
	default
	cp "${WORKDIR}/${P}/${GIT_ROOT}/config-pine64-pinephonepro.aarch64" .config || die

	echo "CONFIG_NETFILTER_XT_CONNMARK=y" > "${T}"/wireguard.config || die

	echo "CONFIG_ANDROID_BINDERFS=y" > "${T}"/waydroid.config

	echo "CONFIG_LOCALVERSION=\"-megi-pmos-pinetoo\"" > "${T}"/version.config || die

	kernel-build_merge_configs "${T}"/{version,waydroid,wireguard}.config
}
