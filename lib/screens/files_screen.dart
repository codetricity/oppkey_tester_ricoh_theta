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
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Image and Video Files for ${Provider.of<CameraNotifier>(context).model}'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          children: [
            // row of buttons to send commands to camera
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UpdateFileListButton(),

                //TODO: put list files button here
              ],
            ),

            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                // child: Image.network('https://i.imgur.com/lk6WHIW.jpg'),
                child: PhotoView(
                  imageProvider: NetworkImage(
                      '${Provider.of<CameraNotifier>(context).fileUri}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
