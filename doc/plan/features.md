# Plan for Features

## Jesse

Focus on improving the look and usability of the application.

* layout per screen
  * different layouts for mobile, tablet, desktop.  Our primary focus is desktop layout. 
    use mediaquery to get all the layouts consistent.
* organization of elements on each screen
* user interaction with app
  * spinner
* colors
  * develop app theme
* fonts
  * include in app theme

## Thumbnail Listing

Having problems listing thumbnails.  Need to change the
way the http requests are made as it's likely the THETA
can't handle rapid requests.

## LivePreview

Need to detect model and change code to get stream based on the model.

## File Management

* show listing of all images on camera.  If it's a big number, over 20 images, then
just show total.  
* delete all images on camera

## Settings Management

* adjust reset settings to make it work with SC2.  This would be good for an article.

## Camera Status

* check battery. change icon
* uptime

## Admin

* when camera reboots, display notice to reconnect Wi-Fi

## Mobile Device Support

Currently using `MediaQuery.of()` to get device width.
Evaluation [responsive_framework](https://pub.dev/packages/responsive_framework) for potential use.

Change status screen to support Android. --Jesse