# 6.4.5.25.04.3.4.0.2.0

**KDE Plasma** updated to **6.4.5**

**KDE Gear** updated to **25.04.3**

**Maui apps** updated to **4.0.2**

## New packages

* `app-misc/kalm`

* `app-misc/klevernotes`

* `app-text/arianna`

* `sys-apps/kjournald`

## Package updates

* `kde-apps/plasma-camera-2.1.0`

## Removed

* `kde-frameworks/qqc2-breeze-style`
  Duplicate of kde-plasma/qqc2-breeze-style::gentoo

## Other changes

* New dependecies for `kde-plasma/plasma-mobile-meta`:
  * `app-misc/francis`
  * `app-office/merkuro`
  * `app-text/marknote`
  * `kde-apps/kwordquiz`
  * `kde-apps/marble`
  * `net-im/kaidan`

# 6.2.5.24.12.3.4.0.1.0

**KDE Gear** updated to **24.12.3**

## Package updates

* `app-containers/waydroid-1.5.1`

* `app-misc/iio-sensor-proxy-3.7`

* `dev-build/cmake-extras-1.8`

* `dev-build/corrosion-0.5.2`

* `dev-libs/deviceinfo-0.2.3`

* `dev-libs/feedbackd-0.8.1`

* `dev-libs/feedbackd-device-themes-0.8.2`

* `dev-libs/libglibutil-1.0.80`

* `media-libs/libcamera-0.5.0`

* `media-video/pipewire-1.2.7-r2`

* `sys-kernel/pinephone-kernel-6.15.6`

* `sys-kernel/pinephonepro-kernel-6.13.0`

## Removed

* `dev-libs/kpublictransport`
  No difference with the `::gentoo` one.

## Other changes

* A new `sys-kernel/pinephonepro-manjaro-kernel` package was added with those versions of `sys-kernel/pinephonepro-kernel` that include Manjaro patches, to avoid confusion.

# 6.2.5.24.08.3.4.0.1.0

**KDE Plasma** updated to **6.2.5**

**KDE Gear** updated to **24.08.3**

**Maui apps** updated to **4.0.1**

### Default USE flags added:

* `telephony`

## Package updates

* `app-misc/iio-sensor-proxy-3.6`

* `app-mobilephone/hfd-service-0.2.3`

* `dev-libs/feedbackd-0.7.0`

* `dev-libs/libgbinder-1.1.42`

* `media-libs/libcamera-0.4.0`

* `media-video/pipewire-1.2.7`

## Removed

* `dev-libs/kosmindoormap`
  Not really needed. No relevant difference with the ::gentoo version.

# 6.1.5.24.08.1.4.0.0.0

**KDE Plasma** updated to **6.1.5**

**KDE Gear** updated to **24.08.1**

**Maui apps** updated to **4.0.0**

## New packages

* `dev-libs/ktactilefeedback`
  New dependency for `kde-apps/plasma-dialer`

* `media-libs/libdng`
  Required for media-gfx/megapixels-2

* `media-libs/libmegapixels`
  Required for media-gfx/megapixels-2

## Package updates

* `app-mobilephone/eg25-manager-0.5.2`

* `dev-libs/feedbackd-0.5.0`

* `dev-libs/libgbinder-1.1.41`

* `media-gfx/megapixels-2.0.0_alpha1`

* `media-libs/libcamera-0.3.2`

* `media-sound/callaudiod-0.1.10`

* `media-video/pipewire-1.2.5`

* `sys-firmware/brcmfmac_sdio-firmware-20240601`

* `sys-firmware/trusted-firmware-a-2.12`

* `sys-firmware/rtl8723bt-firmware-megi-20240211`

* `sys-kernel/pinephone-kernel-6.11.3`

* `sys-kernel/pinephonepro-kernel-6.11.3`

## Removed

* `dev-python/ytmusicapi`
  No longer required, we can use the version from `::gentoo`

* `kde-apps/vakzination`
  No new releases in one year, not ported to KDE 6.

* `dev-vcs/bonsai`
  No activity in 9 months. Not ported to MauiKit 4. Not usable on the PinePhone.

* `maui-apps/booth`
  No activity in 9 months. Not ported to MauiKit 4. Not usable on the PinePhone.

* `net-im/kaidan`
  Not ported to Qt6 yet. It doesn't build.
