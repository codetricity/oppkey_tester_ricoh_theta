# Oppkey Tester for RICOH THETA Cameras

Tester for RICOH THETA 360 camera Wi-Fi APIs.

![home](doc/image/home.png)

![status](doc/image/status.png)

## 360 Panoramic Navigation

![panorama](doc/image/panorama.gif)

## Preview and Quick Inspect on Equirectangular Images

![zoom](doc/image/image_zoom.gif)


## Plan

* [features](doc/plan/features.md)

## Install

```
$ flutter create .
$ flutter pub get
```
Use dev channel
```
$  flutter channel dev
```

Make sure that you have the latest desktop support and that it’s enabled
```
$ flutter config --enable-macos-desktop
$ flutter config --enable-windows-desktop
```

## Windows Desktop

See [this YouTube video](https://youtu.be/YhF3k68qpOU) for 
information on how to set up your 
Windows machine to build and distribute native Windows apps 
on Flutter. 

Tips

* install Visual Studio with Desktop development with C++.  Note that this is not the same as VS Code.
* if you distribute the app, you need to include 3 Windows libraries in the folder with your binary. 

For distribution of the binary, you need the following.

* msvcp140.dll
* vcruntime140.dll
* vcruntime140_1.dll



## Mac Desktop

You must configure entitlements.  Set `com.apple.security.network.client` in
`macos/Runner/*.entitlements`.

## RICOH THETA development information

Extensive documentation related to the SC2 API is available at the site below.

[https://theta360.guide/special/sc2/](https://theta360.guide/special/sc2/)

As of October 15, 2020, there appears to be a bug in the SC2 API to show the thumbnails.  You can get the thumbnail on all camera model with one of two techniques. If you set the maxThumbSize to 640 and grab multiple images,
it will lock up the SC2.  The community documentation 
at the link above has more information.  If you are developing
a RICOH THETA mobile app for a business, please contact jcasman@oppkey.com
for additional assistance. 

In this example app, I'm using this:

``` 
fullURL?type=thumb
```

## Android

In `AndroidManifest.xml`

```
   <application
        android:label="theta_req_res"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="true">
```

## Collaborative Work Process

### Sync Local Repo with Upstream (master repo)

If the codetricity repo is ahead of jcasman, then fetch the upstream (codetricity) repo before you edit your code locally.

```
git fetch upstream
git merge upstream/main
```