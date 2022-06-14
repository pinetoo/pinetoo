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