# Plan for Features

## Jesse

* Focus on improving the look and usability of the application. 
* Go beyond the ability to change the screen layout or color of button to
include:
  * does the change improve the app?  Or, is it just a test for your own knowledge? 
    Aim to improve the app, not just for you to learn.  Our goal is to
    eventually build our own software and we want it to look good and be usable
  * Is the look and feel of the app the best you can do?  Is the size, layout, color,
    and font a representation of all the skills and ability you have applied to the
    problem?  Or, are you justifying a clunky, not-beautiful, app by saying that you're
    building it for yourself (not true) or that you could do better if you tried
    harder or had more time (multitude of reasons).
    At any point in time, aim for the best you can do in the time you have.

### Areas

* layout per screen
  * different layouts for mobile, tablet, desktop.  Our primary focus is desktop layout. 
    use mediaquery to get all the layouts consistent.
* organization of elements on each screen
* user interaction with app
  * spinner
* theme development
  * https://flutter.dev/docs/cookbook/design/themes
  * colors
  * fonts
  * include in app theme

## Documentation

Implement docstrings into code.

dartdoc
https://github.com/dart-lang/dartdoc

docstrings
https://dart.dev/guides/language/effective-dart/documentation

technical writing style
https://en.wikiversity.org/wiki/Technical_writing/Style

To use dartdoc, must set the environmental variable `FLUTTER_ROOT`.  

## Assess Project Management Tool in GitHub

We don't seem to need this at the moment as our level of pull requests is low.

https://github.com/codetricity/oppkey_tester_ricoh_theta/projects

Figure out how to assign an issue.

## Digest Authentication

this is needed for client mode. 

* https://pub.dev/packages/http_auth


## Bluetooth

* https://pub.dev/packages/flutter_blue
* https://blog.kuzzle.io/communicate-through-ble-using-flutter

## Zoom of Images

Assess [photo_view](https://pub.dev/packages/photo_view)

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

## default sleep and power off

For SC2, the default settings are:

* sleepDelay: 300
* offDelay: 600

