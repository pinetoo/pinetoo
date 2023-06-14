# 5.27.4.23.01.0.2.2.2.0

## New packages

* `app-misc/pinephonepro-manjaro-tweaks`

* `app-mobilephone/hfd-service`

* `dev-libs/deviceinfo`
  Dependency for `app-mobilephone/hfd-service`

* `dev-util/cmake-extras`
  Dependency for `app-mobilephone/hfd-service`

* `kde-misc/kpeoplesink`

* `media-libs/libcamera`

* `net-misc/modemmanager`
  With some customizations required for the PinePhones.

* `sys-kernel/pinephonepro-kernel`

## Removed

* `kde-apps/kasts`
  Now available in `::gentoo` (as `media-sound/kasts`)

## Other changes

* `media-gfx/megapixels`
  Add support for PinePhone Pro and burst improvements for PinePhone.

* `media-libs/alsa-ucm-pinephone`
  Add support for PinePhone Pro and use correct upstream.

# 5.27.4.22.12.3.2.2.2.0

**KDE Plasma** updated to **5.27.4**

## Package updates

* `app-emulation/waydroid-1.4.1`

* `dev-libs/feedbackd-0.2.0`

* `dev-libs/libgbinder-1.1.34`

* `sys-kernel/linux-headers-6.1.26`

* `sys-kernel/pinephone-kernel-6.1.26`

## Other changes

* `dev-python/gbinder-python`
  Add support for Python 3.11.

# 5.26.5.22.12.3.2.2.2.0

**KDE Gear** updated to **22.12.3**

**KDE Plasma Mobile** updated to **22.11**

## New packages

* `sys-boot/p-boot-bin`

## Package updates

* `dev-libs/feedbackd-0.1.1`

* `dev-libs/libglibutil-1.0.69`

* `dev-python/ytmusicapi-0.24.0`

## Removed

* `kde-apps/kweather`
  Now available in `::gentoo` (as `kde-misc/kweather`)

* `kde-misc/kweathercore`
  Now available in `::gentoo` (as `dev-libs/kweathercore`)

## Other changes

* `app-misc/pinephone-manjaro-tweaks` add missing systemd service unit it tries to install for ModemManager.

# 5.26.5.22.08.3.2.2.2.0

**Maui apps** updated to **2.2.2**

## Known issues

* `app-misc/pinephone-manjaro-tweaks` is missing the systemd service unit it tries to install for ModemManager.

## New packages

* `dev-libs/mauikit-terminal`
  Dependency for `maui-apps/index` and `maui-apps/nota`.

* `dev-qt/qtsystems`
  Dependency for `dev-libs/mauiman`.

## Package updates

* `dev-libs/feedbackd-0.1.0`

* `dev-libs/feedbackd-device-themes-0.1.0`

* `dev-libs/libgbinder-1.1.32`

* `media-gfx/postprocessd-0.3.0`

* `sys-kernel/linux-headers-6.1.21`

* `sys-kernel/pinephone-kernel-6.1.21`

## Removed

* `gui-libs/gtk`
  A newer version is now available in `::gentoo`.

* `net-im/telegram-desktop`
  A newer version is now available in `::gentoo` no longer affected by the stack smashing problem.

## Other changes

* `app-misc/pinephone-manjaro-tweaks`
  Add --test-quick-suspend-resume to ModemManager.

# 5.26.5.22.08.3.2.2.1.0

**KDE Plasma** updated to **5.26.5**

## Package updates

* `app-emulation/waydroid-1.4.0`

* `dev-libs/feedbackd-0.0.3`

* `dev-libs/feedbackd-device-themes-0.0.3`

* `dev-libs/libgbinder-1.1.32`

* `dev-libs/libglibutil-1.0.68`

* `media-sound/callaudiod-0.1.7`

* `sys-firmware/brcmfmac_sdio-firmware-20230210`

* `sys-kernel/linux-headers-6.1.12`

* `sys-kernel/pinephone-kernel-6.1.12`

## Removed

* `kde-misc/kirigami-addons`
  Now available in `::gentoo` as `dev-libs/kirigami-addons`

## Other changes

* Bump EAPI to 8 for packages using `*.kde.org` eclasses as older EAPIs are no longer supported.

* `net-im/kaidan`: Depend on `<media-libs/zxing-cpp-2`.

# 5.25.5.22.08.3.2.2.1.0

**KDE Gear** updated to **22.08.3**

**KDE Plasma Mobile** updated to **22.06**

**Maui apps** updated to **2.2.1**

## New packages

* `sys-firmware/brcmfmac_sdio-firmware`
  Firmware for Broadcom SDIO used in RockPro64.

## Package updates

* `app-emulation/waydroid-1.3.4`

* `app-mobilephone/eg25-manager-0.4.6`
  Fixs support for community firmware.

* `dev-libs/feedbackd-0.0.2`

* `dev-libs/feedbackd-device-themes-0.0.2`

* `dev-libs/libgbinder-1.1.30`

* `dev-libs/mauiman-1.0.1`

* `kde-misc/kirigami-addons-0.6.1`

* `media-gfx/megapixels-1.6.0`

* `media-sound/callaudiod-0.1.6`

## Other changes

* Fixed paths in pkgconfig files from `dev-libs/libgbinder` and `dev-libs/libglibutil`.

# 5.25.5.22.04.3.2.2.2.1

## Package updates

* `app-emulation/waydroid-1.3.3`

* `dev-libs/libgbinder-1.1.26`

* `kde-apps/okular-22.04.3-r1`

* `kde-misc/kirigami-addons-0.5`

* `sys-kernel/linux-headers-5.19.12`

## Other changes

* Fixed missing dependency `kde-plasma/oxygen-sounds` for `kde-plasma/plasma-mobile-meta`.

* Fixed setting additional configuration options in `sys-kernel/pinephone-kernel`.

# 5.25.5.22.04.3.2.2.2.0

**KDE Plasma** updated to **5.25.5**

## Package updates

* `kde-misc/kirigami-addons-0.4`

* `net-im/telegram-desktop-4.1.1`
  This is actually a downgrade from version 4.2.4 currently in ::gentoo which seems to have a stack smashing problem.

* `sys-kernel/pinephone-kernel-5.19.12`

# 5.24.6.22.04.3.2.2.2.1

## Package updates

* `app-emulation/waydroid-1.3.2`

* `app-mobilephone/modemmanager-policykit-rules-1.1`
  Add new org.freedesktop.ModemManager1.Control action required by plasma-settings for cellular networks configuration.

* `app-mobilephone/eg25-manager-0.4.5`

* `dev-python/gbinder-python-1.1.1`

* `kde-plasma/plasma-mobile-settings-20220812`

* `sys-kernel/linux-headers-5.19.11`

* `sys-kernel/pinephone-kernel-5.19.11`

# 5.24.6.22.04.3.2.2.2.0

**Maui apps** updated to **2.2.0**

## New packages

* `dev-libs/mauiman`
  New dependency for `dev-libs/mauikit-2.2.0`

## Package updates

* `sys-kernel/linux-headers-5.19.4`

* `sys-kernel/pinephone-kernel-5.19.4`

# 5.24.6.22.04.3.2.1.2.0

**KDE Plasma** updated to **5.24.5**

## Package updates

* `app-emulation/waydroid-1.3.0`

* `sys-kernel/linux-headers-5.19.2`

* `sys-kernel/pinephone-kernel-5.19.2`

## New packages

* `media-gfx/postprocessd`
  Native postprocessing for media-gfx/megapixels.

## Other changes

* Fixed default posprocessor path in `media-gfx/megapixels`.

* app-misc/pinephone-manjaro-tweaks: Don't install custom dconf settings which only seems to break stuff like changing media-gfx/megapixels settings.

# 5.24.5.22.04.3.2.1.2.0

**KDE Plasma** updated to **5.24.5**

**KDE Gear** updated to **22.04.3**

## Package updates

* `app-misc/iio-sensor-proxy-3.4`

* `app-mobilephone/eg25-manager-0.4.4`

* `dev-libs/libgbinder-1.1.22`

* `kde-misc/kirigami-addons-0.3`

* `kde-misc/kweathercore-0.6`

* `kde-plasma/plasma-mobile-settings-20220628`

* `media-gfx/megapixels-1.5.2`

* `sys-kernel/pinephone-kernel-5.18.14`

* `x11-apps/maliit-keyboard-2.3.1`

* `x11-libs/maliit-2.3.0`

## New packages

* `dev-libs/mpris-qt5`
  New dependency for `kde-apps/plasma-dialer`

* `gui-libs/gtk`
  Version 4.7.1 not yet in ::gento but required by media-gfx/megapixels
  See https://gitlab.com/postmarketOS/megapixels/-/issues/48

* `media-sound/callaudiod`
  New dependency for `kde-apps/plasma-dialer`

## Removed

* `dev-libs/qcoro`
  This was a dependency for `app-mobilephone/spacebar` which is no longer required because it can now use the `::gentoo` version.

## USE flag changes

### Default USE flags:

* `tkip` USE flag enabled by default as some old WiFi networks still use it.

* In `mobile` profiles:

  * Enabled `harfbuzz` USE flag for `media-libs/freetype` required for `sys-apps/flatpak`

  * Enabled by default:
    * `share`
    * `tslib`
    * `vpx`
    * `webp`
    * `wireless`

  * Disabled by default:
    * `cdda`
    * `gpm`
    * `joystick`
    * `ppp`
    * `smartcard`

* In Plasma Mobile profiles:

  * Enable `localstorage` USE flag for `dev-qt/qtdeclarative` as required for `kde-plasma/plasma-dialer`.

  * Enable `opus` and `theora` USE flags for `net-libs/qxmpp` as required for `net-im/kaidan`.

  * Enable `opus` USE flag for `media-video/ffmpeg` as required for `net-im/telegram-desktop`.

  * Enable `wep` USE flag for `net-wireless/wpa_supplicant`.

  * Disabled by default:
    * `gtk`

* In the PinePhone profiles:

  * Disable `jumbo-build` for `dev-qt/qtwebengine` as the PinePhone doesn't have enough memmory for the jumbo build.

  * Enabled by default:
    * `kms`
    * `libdrm`
    * `libkms`
    * `lm_sensors`
    * `video_cards_lima`

## Other changes

Fixed missing dependency `kde-plasma/oxygen` for `kde-plasma/plasma-mobile-meta`.

# 5.24.4.21.12.3.2.1.2.1

## Package updates

* `dev-libs/feedbackd-0.0.0_pre20220520`

* `dev-libs/feedbackd-device-themes-0.0.20220523`

* `dev-libs/libglibutil-1.0.65`

* `dev-libs/libgbinder-1.1.22`

* `kde-plasma/plasma-mobile-settings-20220530`

* `sys-kernel/linux-headers-5.18.6`

* `sys-kernel/pinephone-kernel-5.18.6`

## Removed

No consumers left, most of them because of the switch in Plasma Mobile from Ofono to ModemManager:

* `net-misc/ofono`

* `net-misc/ofonoctl`

# 5.24.4.21.12.3.2.1.2.0

**Maui apps** updated to **2.1.2**

# 5.24.4.21.12.3.2.1.1.0

**KDE Plasma** updated to **5.24.4**

**KDE Gear** updated to **21.12.3**

**Maui apps** updated to **2.1.1**

## Other package updates

* `app-emulation/waydroid-1.2.1`

* `dev-libs/libglibutil-1.0.63`

* `kde-plasma/plasma-mobile-settings-20220421`

* `dev-python/ytmusicapi-0.19.4`  
  As required by media-sound/audiotube-21.12 (newer versions are not supported)

* `x11-apps/maliit-keyboard-2.2.1.1`

## New packages

* `media-video/plasmatube`

* `kde-apps/vakzination`

* `kde-plasma/plasma-mobile-sounds`

* `app-mobilephone/modemmanager-policykit-rules`  
  Fixes PolicyKit dialog showing every time a call or text message is sent or received.

## Removed

No consumers left, most of them because of the switch in Plasma Mobile from Ofono to ModemManager:

* `dev-libs/libofono-qt`

* `net-libs/libqofono`

* `net-misc/telepathy-ofono`

## USE flag changes

### Default USE flags:

* Disable the `ofono` USE flag and enable the `modemmanager` one instead for the mobile/plasma profile following the switch from oFono to ModemManager upstream.

* Enable `bluetooth` USE flag for the mobile profile.

### Added USE flags:

* `kde-plasma/plasma-mobile-meta[+desktop-portal]`

* `app-mobilephone/pinephone-meta[+policykit]`

* `kde-apps/kasts[networkmanager]`

### Removed USE flags:

Following changes in ::gentoo

* `kde-apps/okular[chm]

## Other changes

Fixed installation paths for Alsa UCM files in `media-libs/alsa-ucm-pinephone`.

Fixed missing dependencies for kde-plasma/plasma-mobile-meta:

* kde-apps/kaccounts-providers

* kde-plasma/kwayland-integration

* kde-plasma/xdg-desktop-portal-kde

* media-video/plasmatube

Fixed a few HOMEPAGEs.
