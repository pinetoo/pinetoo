# 5.24.4.22.04.3.2.1.2.1

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

* `media-sound/callaudiod`
  New dependency for `kde-apps/plasma-dialer`

## Removed

* `dev-libs/qcoro`
  This was a dependency for `app-mobilephone/spacebar` which is no longer required because it can now use the `::gentoo` version.

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
