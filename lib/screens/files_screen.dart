import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/windows/request_window.dart';
import 'package:theta_req_res/windows/response_window.dart';
import 'package:theta_req_res/screens/navigation_drawer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:theta_req_res/camera_api/files/update_file_list_button.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Image and Video Files for ${Provider.of<CameraNotifier>(context).model}'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),

            // row of buttons to send commands to camera
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UpdateFileListButton(),

                //TODO: put list files button here
              ],
            ),

            Expanded(
              child: device.width < 1000
                  ? MobilePhotoViewer()
                  : DesktopPhotoViewer(),
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopPhotoViewer extends StatelessWidget {
  const DesktopPhotoViewer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;

    return Row(
      children: [
        Provider.of<CameraNotifier>(context).fileUriList.length > 0
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: (device.width / 3.2),
                // child: Text(
                //     '${Provider.of<CameraNotifier>(context).fileUriList[0]}'),
                // child: Image.network(
                //     Provider.of<CameraNotifier>(context).fileUriList[0]),
                child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 10.0,
                    child: Image.network(
                        Provider.of<CameraNotifier>(context).fileUriList[0])),
              )
            : Container(child: Text('Image 1')),
        Provider.of<CameraNotifier>(context).fileUriList.length > 1
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: device.width / 3.2,
                child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 10.0,
                    child: Image.network(
                        Provider.of<CameraNotifier>(context).fileUriList[1])),
              )
            : Container(),
        Provider.of<CameraNotifier>(context).fileUriList.length > 2
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: device.width / 3.2,
                child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 10.0,
                    child: Image.network(
                        Provider.of<CameraNotifier>(context).fileUriList[2])),
              )
            : Container(),
      ],
    );
  }
}

class MobilePhotoViewer extends StatelessWidget {
  const MobilePhotoViewer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      // child: Image.network('https://i.imgur.com/lk6WHIW.jpg'),
      child: PhotoView(
        imageProvider:
            NetworkImage('${Provider.of<CameraNotifier>(context).fileUri}'),
      ),
    );
  }
}
